
class SubmitReceiverPageArguments {
  final Future<void> Function({required String receiver})
      afterSubmittingReceiver;
  final Future<void> Function({required String receiver})? codeSender;
  final Future<void> Function(
      {required String receiver,
      required String otpCode}) afterSuccessVerification;
  final Future<void> Function(
      {required String receiver, required String otpCode})? codeChecker;
  final String pageTitle;
  final bool sendInitialMessage;

  SubmitReceiverPageArguments({
    required this.codeSender,
    required this.sendInitialMessage,
    required this.codeChecker,
    required this.pageTitle,
    required this.afterSuccessVerification,
    required this.afterSubmittingReceiver,
  });
}
