import 'package:trend/core/utils/enums.dart';

class ConfirmReceiverPageArguments {
  final Future<void> Function(
      {required String receiver,
      required String otpCode}) afterSuccessSubmitting;
  final Future<void> Function(
      {required String receiver, required String otpCode})? codeChecker;
  final Future<void> Function({required String receiver})? codeSender;
  final String receiver;
  final bool sendInitialMessage;

  ConfirmReceiverPageArguments(
      {required this.codeChecker,
      required this.sendInitialMessage,
      required this.codeSender,
      required this.afterSuccessSubmitting,
      required this.receiver,});
}
