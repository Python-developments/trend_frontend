import 'package:injectable/injectable.dart';
import 'package:trend/core/controllers/base_controller.dart';
import 'package:trend/core/controllers/controllers_mixins/form_mixin.dart';
import 'package:trend/core/presentation/arguments/submit_new_password_arguments.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/core/presentation/snake_bars/snack_bar_messages.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/errors/auth_errors.dart';
import 'package:trend/data/repositories/abstract/i_auth_repository.dart';

@injectable
class SubmitNewPasswordController extends BaseController with FormMixin {
  final IAuthRepository authRepository;
  final SubmitNewPasswordArguments args;

  SubmitNewPasswordController(
    @factoryParam this.args,
    this.authRepository,
    super.logger,super.appRouter,super.snakeBarShower  );

  @override
  Future<void> afterSuccessSubmitting() async {
    snakeBarShower.showSnakeBar(
        SnakeBarMessages.passwordChangedSuccessfully, ToastType.success);
    getAppRouter.popUntilRoot();
    await args.afterSuccessSubmitting(
        oldPassword: valueOf('oldPassword'),
        newPassword: valueOf('newPassword')!);
  }

  @override
  Future<void> submitFunction() async {
    if (valueOf('newPassword') != valueOf('confirmPassword')) {
      throw PasswordDoesntMatchConfirmError();
    }
    await args.onSubmitNewPassword(
        newPassword: valueOf('newPassword')!,
        oldPassword: valueOf('oldPassword'));
  }
}
