import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:trend/core/controllers/base_controller.dart';
import 'package:trend/core/controllers/localization_controller.dart';
import 'package:trend/core/controllers/user_data_controller.dart';
import 'package:trend/core/presentation/arguments/confirm_otp_page_arguments.dart';
import 'package:trend/core/presentation/arguments/login_page_arguments.dart';
import 'package:trend/core/presentation/arguments/submit_new_password_arguments.dart';
import 'package:trend/core/presentation/arguments/submit_receiver_page_arguments.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/core/presentation/sheets/show_rate_order_bottom_sheet.dart';
import 'package:trend/core/presentation/snake_bars/snack_bar_messages.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/dtos/login_dto.dart';
import 'package:trend/data/dtos/register_dto.dart';
import 'package:trend/data/dtos/update_profile_dto.dart';
import 'package:trend/data/local_database/databases/abstract/i_app_local_database.dart';
import 'package:trend/data/local_database/entities/user_entity.dart';
import 'package:trend/data/models/address_model.dart';
import 'package:trend/data/models/auth/login_response_model.dart';
import 'package:trend/data/models/auth/user_profile_model.dart';
import 'package:trend/data/repositories/abstract/i_auth_repository.dart';
import 'package:trend/data/repositories/abstract/i_profile_repository.dart';
import 'package:trend/dependencies.dart';
import 'package:trend/third_parties_modules/abstract/i_sharing_module.dart';

part 'auth_controller.g.dart';

@singleton
class AuthController extends AuthControllerBase with _$AuthController {
  AuthController(
      super.localizationController,
      super.userDataController,
      super.sharingModule,
      super.authRepository,
      super.profileRepository,
      super.logger,super.appRouter,super.snakeBarShower);
}

abstract class AuthControllerBase extends BaseController with Store {
  final LocalizationController localizationController;
  final UserDataController userDataController;
  final ISharingModule sharingModule;
  final IAuthRepository authRepository;
  final IProfileRepository profileRepository;
  AuthControllerBase(
      this.localizationController,
      this.userDataController,
      this.sharingModule,
      this.authRepository,
      this.profileRepository,
      super.logger,super. appRouter,super. snakeBarShower);

  @override
  bool get isLazyController => true;
  @observable
  UserProfileModel? userProfileModel;
  @observable
  UserEntity? cachedUser;
  @computed
  bool get isSocialLogin => userProfileModel?.isSocialLogin == true;

  @computed
  bool get isGuestUser => userProfileModel == null;

  @computed
  bool get isVerifiedUser =>
      userProfileModel?.isPhoneVerified == true &&
      userProfileModel?.isEmailVerified == true;
  @override
  @action
  Future<void> loadData() => runStorePrimaryFunction(() async {
        cachedUser = await authRepository.getCachedUser();
        if (cachedUser?.token.isNotEmpty ?? false) {
          await getUserProfile();
          _checkUserLanguage();
          unawaited(_refreshProfile());
        }
      });


  @action
  Future<void> getUserProfile()async{
    userProfileModel = await authRepository.getUserProfile();
  }

  @action
  Future<void> _refreshProfile() => Future.wait(
      [checkAccountConfirmation(), userDataController.refreshData()]);

  @action
  Future<void> changePhoneNumber() => runStoreSecondaryFunction(() async {
        await appRouter.replace(SubmitPhoneNumberRoute(
            args: SubmitReceiverPageArguments(
          verificationType: OtpVerificationType.phone,
          pageTitle: 'Please enter your new phone number',
          sendInitialMessage: true,
          afterSubmittingReceiver: ({required final String receiver}) async {},
          afterSuccessVerification: (
              {required final String receiver,
              required final String otpCode}) async {
            userProfileModel = await authRepository.updateUserProfile(
                updateProfileDto: UpdateProfileDto(phoneNumber: receiver));

            snakeBarShower.showSnakeBar(
                SnakeBarMessages.successChangingPhoneNumber, ToastType.success);
            appRouter.popUntilRoot();
            await appRouter.replace(HomeRouteNavigation(initialTile: HomeNavigationBarTileType.cart));
          },
          codeSender: ({required final String receiver}) =>
              authRepository.sendPhoneNumberConfirmationCode(
            phoneNumber: receiver,
          ),
          codeChecker: (
                  {required final String receiver,
                  required final String otpCode}) =>
              authRepository.checkPhoneNumberConfirmationCode(
            phoneNumber: receiver,
            otpCode: otpCode,
          ),
        )));
      });

  @action
  Future<void> logout() => runStoreSecondaryFunction(() async {
        await authRepository.logout();
        userProfileModel = null;
        emptyUserData();
        await appRouter
            .replace(LoginRoute(args: LoginPageArguments(homePageTile: HomeNavigationBarTileType.wowvir)));
      });

  @action
  Future<void> deleteAccount() => runStoreSecondaryFunction(() async {
        await authRepository.deleteAccount();
        userProfileModel = null;
        emptyUserData();
        appRouter.popUntilRoot();
        await appRouter
            .replace(LoginRoute(args: LoginPageArguments(homePageTile: HomeNavigationBarTileType.wowvir)));
      });

  void emptyUserData() => userDataController.emptyUserData();
  Future<void> changeUserLastLocation(
          {required final double latitude,
          required final double longitude,
          required final String? addressString,
          required final AddressModel? address}) =>
      runStoreSecondaryFunction(() async {
        await authRepository.setLastLocation(
            latitude: latitude,
            longitude: longitude,
            addressString: addressString,
            address: address);
      });
  Future<void> changeUserLanguage({required final String languageCode}) =>
      runStoreSecondaryFunction(() async {
        if (!isGuestUser) {
          await profileRepository.changeAppLanguage(languageCode: languageCode);
        }
      });

  Future<void> _login(final Future<LoginResponseModel> Function() profileGetter,
      final HomeNavigationBarTileType destination) async {
    final LoginResponseModel loginResponseModel = await profileGetter();
    userProfileModel = loginResponseModel.user;
    _checkUserLanguage();
     unawaited(_refreshProfile());

    appRouter.popUntilRoot();
    await appRouter.replace(HomeRouteNavigation(initialTile: destination));
  }

  @action
  Future<void> login({required final LoginDto loginDto,
          required final HomeNavigationBarTileType destination}) async =>
      _login(() => authRepository.loginByEmail(loginDto),destination);

  @action
  Future<void> loginUsingFacebook(
          {required final HomeNavigationBarTileType destination,
          required final String? referralCode}) async => _login(
          () => authRepository.loginUsingFacebook(referralCode: referralCode),destination);

  @action
  Future<void> loginUsingApple(
          {required final HomeNavigationBarTileType destination,
          required final String? referralCode}) =>
      _login(() => authRepository.loginUsingApple(referralCode: referralCode),destination);

  @action
  Future<void> loginUsingGmail(
          {required final HomeNavigationBarTileType destination,
          required final String? referralCode}) =>
      _login(() => authRepository.loginUsingGmail(referralCode: referralCode), destination);

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

  @action
  void loginAsGuest() {
    userProfileModel = null;
    appRouter.popUntilRoot();
    appRouter.replace(HomeRouteNavigation());
  }

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
            verificationType: OtpVerificationType.email,
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
                      LoginRoute(args: LoginPageArguments(homePageTile: HomeNavigationBarTileType.wowvir)));
                },
              )));
            })));
  }

  Future<void> checkAccountConfirmation() async {
    if ((userProfileModel?.isEmailVerified == false)) {
      await appRouter.push(ConfirmReceiverRoute(
          args: ConfirmReceiverPageArguments(
        verificationType: OtpVerificationType.phone,
        sendInitialMessage: true,
        receiver: userProfileModel!.email,
        codeSender: ({required final String receiver}) =>
            authRepository.sendEmailConfirmationCode(
          email: receiver,
        ),
        codeChecker: (
                {required final String receiver,
                required final String otpCode}) =>
            authRepository.checkEmailConfirmationCode(
          email: receiver,
          otpCode: otpCode,
        ),
        afterSuccessSubmitting: (
            {required final String otpCode,
            required final String receiver}) async {
          appRouter.popUntilRoot();
        },
      )));
    }
  }

  Future<void> checkPhoneNumberConfirmation() =>
      runStoreSecondaryFunction(() async {
        if (userProfileModel != null) {
          if (userProfileModel!.phoneNumber == null) {
            await changePhoneNumber();
          } else if (!userProfileModel!.isPhoneVerified) {
            await appRouter.replace(ConfirmReceiverRoute(
                args: ConfirmReceiverPageArguments(
              sendInitialMessage: true,
              verificationType: OtpVerificationType.phone,
              receiver: userProfileModel!.phoneNumber!,
              codeSender: ({required final String receiver}) =>
                  authRepository.sendPhoneNumberConfirmationCode(
                phoneNumber: receiver,
              ),
              codeChecker: (
                      {required final String receiver,
                      required final String otpCode}) =>
                  authRepository.checkPhoneNumberConfirmationCode(
                phoneNumber: receiver,
                otpCode: otpCode,
              ),
              afterSuccessSubmitting: (
                  {required final String otpCode,
                  required final String receiver}) async {
                userProfileModel = await authRepository.updateUserProfile(
                    updateProfileDto: UpdateProfileDto(phoneNumber: receiver));
                appRouter.popUntilRoot();
              },
            )));
          }
        }
      });

  void _checkUserLanguage(){
    if (userProfileModel!.language != localizationController.currentLocale.languageCode) {
      localizationController.changeLanguage(userProfileModel!.language);
    }
  }

  Future<void> checkLastRatingOrder() async {
    if (userProfileModel?.lastUnratedOrderId != null) {
      await showRateOrderBottomSheet(
          orderId: userProfileModel!.lastUnratedOrderId!, pageRefresher: null);
    }
  }

  Future<void> shareReferralCode() => sharingModule.shareReferralCode(
      referralCode: userProfileModel!.referralCode);

  @override
  @disposeMethod
  void dispose() {
    getIt<IAppLocalDatabase>().close();
    super.dispose();
  }
}
