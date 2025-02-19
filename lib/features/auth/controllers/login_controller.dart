import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:trend/core/controllers/auth_controller.dart';
import 'package:trend/core/controllers/base_controller.dart';
import 'package:trend/core/controllers/controllers_mixins/form_mixin.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/data/dtos/login_dto.dart';

part 'login_controller.g.dart';

@injectable
class LoginController extends LoginControllerBase with _$LoginController {
  LoginController( super.authController, super.logger,super.appRouter,super.snakeBarShower);
}

abstract class LoginControllerBase extends BaseController
    with FormMixin, Store {
  final AuthController authController;
  LoginControllerBase(
    this.authController,
    super.logger,super.appRouter,super.snakeBarShower  );

  @override
  Future<void> afterSuccessSubmitting() =>
      appRouter.replaceAll([HomeRouteNavigation()]);

  @override
  Future<void> submitFunction() async {
    await authController.login(
        loginDto: LoginDto(
            username: valueOf('username')!,
            password: valueOf('password')!,),);
  }

  /*@action
  void loginUsingGmail() => runStorePrimaryFunction(
        () => authController.loginUsingGmail(
        onCatchError: (final e) => snakeBarShower.showSnakeBar(
            e is CustomError
                ? e.errorMessage
                : SomethingWentWrongError().errorMessage,
            ToastType.error),
      );

  @action
  void loginUsingApple() => runStorePrimaryFunction(
        () => authController.loginUsingApple(
            destination: args.homePageTile,
            referralCode: args.sharedReferralCode),
        onCatchError: (final e) => snakeBarShower.showSnakeBar(
            e is CustomError
                ? e.errorMessage
                : SomethingWentWrongError().errorMessage,
            ToastType.error),
      );
  @action
  void loginUsingFacebook() => runStorePrimaryFunction(
        () => authController.loginUsingFacebook(
            destination: args.homePageTile,
            referralCode: args.sharedReferralCode),
        onCatchError: (final e) => snakeBarShower.showSnakeBar(
            e is CustomError
                ? e.errorMessage
                : SomethingWentWrongError().errorMessage,
            ToastType.error),
      );*/


  void restorePassword() => authController.restorePassword();
}
