class CustomError implements Exception {
  final String errorMessage;
  final String? errorImage, subtitle;
  CustomError(
      {required this.errorMessage, required this.errorImage, this.subtitle});
}
