import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:trend/core/controllers/base_controller.dart';
import 'package:trend/core/presentation/arguments/submit_new_password_arguments.dart';
import 'package:trend/core/presentation/arguments/submit_receiver_page_arguments.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/data/dtos/login_dto.dart';
import 'package:trend/data/dtos/register_dto.dart';
import 'package:trend/data/dtos/update_profile_dto.dart';
import 'package:trend/data/local_database/databases/abstract/i_app_local_database.dart';
import 'package:trend/data/local_database/entities/user_entity.dart';
import 'package:trend/data/models/auth/login_response_model.dart';
import 'package:trend/data/models/auth/user_info_model.dart';
import 'package:trend/data/repositories/abstract/i_auth_repository.dart';
import 'package:trend/data/repositories/abstract/i_profile_repository.dart';
import 'package:trend/dependencies.dart';

part 'auth_controller.g.dart';

@singleton
class AuthController extends AuthControllerBase with _$AuthController {
  AuthController(
      super.authRepository,
      super.profileRepository,
      super.logger,super.appRouter,super.snakeBarShower);
}

abstract class AuthControllerBase extends BaseController with Store {
  final IAuthRepository authRepository;
  final IProfileRepository profileRepository;
  AuthControllerBase(
      this.authRepository,
      this.profileRepository,
      super.logger,super. appRouter,super. snakeBarShower);

  @override
  bool get isLazyController => true;
  @observable
  UserInfoModel? userProfileModel;
  @observable
  UserEntity? cachedUser;

  @override
  @action
  Future<void> loadData() => runStorePrimaryFunction(() async {
        cachedUser = await authRepository.getCachedUser();
        if (cachedUser?.token.isNotEmpty ?? false) {
          await getUserProfile();
          unawaited(_refreshProfile());
        }
      });


  @action
  Future<void> getUserProfile()async{
    userProfileModel = await authRepository.getUserProfile();
  }

  @action
  Future<void> _refreshProfile() => checkAccountConfirmation();


  @action
  Future<void> logout() => runStoreSecondaryFunction(() async {
        await authRepository.logout();
        userProfileModel = null;
        emptyUserData();
        await appRouter
            .replace(LoginRoute());
      });

  @action
  Future<void> deleteAccount() => runStoreSecondaryFunction(() async {
        await authRepository.deleteAccount();
        userProfileModel = null;
        emptyUserData();
        appRouter.popUntilRoot();
        await appRouter
            .replace(LoginRoute());
      });

  void emptyUserData() {}


  Future<void> _login(final Future<LoginResponseModel> Function() profileGetter,) async {
    final LoginResponseModel loginResponseModel = await profileGetter();
    userProfileModel = loginResponseModel.user;
     unawaited(_refreshProfile());

    appRouter.popUntilRoot();
    await appRouter.replace(HomeRouteNavigation());
  }

  @action
  Future<void> login({required final LoginDto loginDto,}) async =>
      _login(() => authRepository.loginByEmail(loginDto));

  @action
  Future<void> changePassword() => appRouter.push(SubmitNewPasswordRoute(
      args: SubmitNewPasswordArguments(
          isRequiresOldPassword: true,
          onSubmitNewPassword: (
                  {required final String newPassword,
                  final String? oldPassword}) =>
              authRepository.changePassword(
                  oldPassword: oldPassword!, newPassword: newPassword),
          afterSuccessSubmitting: (
              {required final String newPassword,
              final String? oldPassword}) async {
            appRouter.popUntilRoot();
          })));

/*
  @action
  void loginAsGuest() {
    userProfileModel = null;
    appRouter.popUntilRoot();
    appRouter.replace(HomeRouteNavigation());
  }
*/

  @action
  Future<void> updateProfile(
          {required final UpdateProfileDto updateProfileDto}) =>
      runStoreSecondaryFunction(() async {
        userProfileModel = await authRepository.updateUserProfile(
            updateProfileDto: updateProfileDto);
      });

  @action
  Future<void> register(final RegisterDto registerDto) async {
    await authRepository.register(registerDto);
  }

  Future<void> restorePassword() async {
    await appRouter.push(SubmitEmailRoute(
        args: SubmitReceiverPageArguments(
            sendInitialMessage: false,
            codeSender: ({required final String receiver}) async {
              await authRepository.sendForgetPasswordCode(email: receiver);
            },
            codeChecker: (
                    {required final String receiver,
                    required final String otpCode}) =>
                authRepository.checkEmailConfirmationCode(
                    email: receiver, otpCode: otpCode),
            pageTitle: 'Please enter your email to confirm your account',
            afterSubmittingReceiver: ({required final String receiver}) async {
              await authRepository.sendForgetPasswordCode(email: receiver);
            },
            afterSuccessVerification: (
                {required final String receiver,
                required final String otpCode}) async {
              await appRouter.push(SubmitNewPasswordRoute(
                  args: SubmitNewPasswordArguments(
                isRequiresOldPassword: false,
                onSubmitNewPassword: (
                    {required final String newPassword,
                    final String? oldPassword}) async {
                  await authRepository.resetPassword(
                      email: receiver,
                      otpCode: otpCode,
                      newPassword: newPassword);
                },
                afterSuccessSubmitting: (
                    {required final String newPassword,
                    final String? oldPassword}) async {
                  await appRouter.push(
                      LoginRoute());
                },
              )));
            })));
  }

  Future<void> checkAccountConfirmation()async{
    return;
  }


  @override
  @disposeMethod
  void dispose() {
    getIt<IAppLocalDatabase>().close();
    super.dispose();
  }
}
