import 'dart:async';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:trend/core/controllers/base_controller.dart';
import 'package:trend/core/controllers/controllers_mixins/form_mixin.dart';
import 'package:trend/core/presentation/arguments/confirm_receiver_page_arguments.dart';
import 'package:trend/data/errors/core_errors.dart';

part 'confirm_otp_controller.g.dart';

@injectable
class ConfirmOtpController extends ConfirmOtpControllerBase
    with _$ConfirmOtpController {
  ConfirmOtpController(@factoryParam super.args, super.logger,super.appRouter,super.snakeBarShower);
}

abstract class ConfirmOtpControllerBase extends BaseController
    with FormMixin, Store {
  final ConfirmReceiverPageArguments args;
  late Timer resendTimer;
  ConfirmOtpControllerBase(
    this.args,
    super.logger,super.appRouter,super.snakeBarShower  ) {
    onInit();
    initTimer();
  }

  @override
  Future<void> onInit() async {
    if (args.sendInitialMessage) {
      await args.codeSender!(receiver: args.receiver);
    }
  }

  void initTimer() {
    resendSecondsCounter = 20;
    resendTimer = Timer.periodic(const Duration(seconds: 1), (final timer) {
      if (resendSecondsCounter == 0) {
        resendTimer.cancel();
      }
      resendSecondsCounter--;
    });
  }

  @observable
  int resendSecondsCounter = 0;
  @action
  void changeOtpCode(final String newCode) => setValue('otpCode', newCode);

  @action
  void resendCode() => runStoreSecondaryFunction(() async {
        if (resendSecondsCounter > 0) {
          return;
        }

        await args.codeSender!(receiver: args.receiver);
        initTimer();
      });

  @override
  Future<void> afterSuccessSubmitting() async {
    await args.afterSuccessSubmitting(
        otpCode: valueOf('otpCode')!, receiver: args.receiver);
  }

  @override
  Future<void> submitFunction() async {
    if ((valueOf('otpCode')?.length ?? 0) < 6) {
      throw IsNotSelectedError(fieldName: 'code');
    }
    if (args.codeChecker != null) {
      await args.codeChecker!(
          otpCode: valueOf('otpCode')!, receiver: args.receiver);
    }
  }

  @override
  void dispose() {
    resendTimer.cancel();
    super.dispose();
  }
}
