class AppleSignInResponseModel {
  final String email;
  final String? name, token;

  AppleSignInResponseModel({required this.name, required this.token, required this.email});
}
