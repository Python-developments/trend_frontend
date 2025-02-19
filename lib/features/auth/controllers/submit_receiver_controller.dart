import 'package:injectable/injectable.dart';
import 'package:trend/core/controllers/base_controller.dart';
import 'package:trend/core/controllers/controllers_mixins/form_mixin.dart';
import 'package:trend/core/presentation/arguments/submit_receiver_page_arguments.dart';
import 'package:trend/data/repositories/abstract/i_auth_repository.dart';

@injectable
class SubmitReceiverController extends BaseController with FormMixin {
  final IAuthRepository authRepository;
  final SubmitReceiverPageArguments args;
  SubmitReceiverController(
    @factoryParam this.args,
    this.authRepository,
    super.logger,super.appRouter,super.snakeBarShower  );

  @override
  Future<void> afterSuccessSubmitting() async {
    /*await getAppRouter.push(ConfirmReceiverRoute(
        args: ConfirmReceiverPageArguments(
      receiver: valueOf('receiver')!,
      sendInitialMessage: args.sendInitialMessage,
      afterSuccessSubmitting: args.afterSuccessVerification,
      codeChecker: args.codeChecker,
      codeSender: args.codeSender,
    )));*/
  }

  @override
  Future<void> submitFunction() =>
      args.afterSubmittingReceiver(receiver: valueOf('receiver')!);
}
