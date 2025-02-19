import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:trend/core/controllers/auth_controller.dart';
import 'package:trend/core/controllers/base_controller.dart';
import 'package:trend/core/controllers/controllers_mixins/form_mixin.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/data/dtos/login_dto.dart';
import 'package:trend/data/dtos/register_dto.dart';
import 'package:trend/data/errors/auth_errors.dart';
import 'package:trend/data/repositories/abstract/i_auth_repository.dart';


@injectable
class RegisterController extends BaseController with FormMixin, Store {
  final IAuthRepository authRepository;
  final AuthController authController;
  RegisterController(
    this.authController,
    this.authRepository,
    super.logger,super.appRouter,super.snakeBarShower  );

  @override
  Future<void> submitFunction() async {
    if (valueOf('password') != valueOf('confirmPassword')) {
      throw PasswordDoesntMatchConfirmError();
    }

    await authController.register(RegisterDto(
      username: valueOf('username')!,
      password: valueOf('password')!,
      email: valueOf('email')!,
      confirmPassword: valueOf('confirmPassword')!,
    ));
  }

  @override
  Future<void> afterSuccessSubmitting() async {
    final RegisterDto registerModel =RegisterDto(
      username: valueOf('username')!,
      password: valueOf('password')!,
      email: valueOf('email')!,
      confirmPassword: valueOf('confirmPassword')!,
    );

    await authController.login(
      loginDto: LoginDto(
        username: registerModel.username,
        password: registerModel.password,),);

    await getAppRouter.replaceAll([HomeRouteNavigation()]);/*
    await getAppRouter.push(ConfirmReceiverRoute(
        args: ConfirmReceiverPageArguments(
      receiver: registerModel.email,
      codeSender: ({required final String receiver}) =>
          authRepository.sendEmailConfirmationCode(email: receiver),
      sendInitialMessage: false,
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
        await authController.login(
            loginDto: LoginDto(
                username: registerModel.username,
                password: registerModel.password,),);

        await getAppRouter.replaceAll([HomeRouteNavigation()]);
      },
    )));*/
  }

}
