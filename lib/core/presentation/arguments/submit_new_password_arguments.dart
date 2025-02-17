class SubmitNewPasswordArguments {
  final bool isRequiresOldPassword;
  final Future<void> Function(
      {required String newPassword, String? oldPassword}) onSubmitNewPassword;
  final Future<void> Function(
      {required String newPassword,
      String? oldPassword}) afterSuccessSubmitting;
  SubmitNewPasswordArguments(
      {required this.onSubmitNewPassword,
      required this.isRequiresOldPassword,
      required this.afterSuccessSubmitting});
}
