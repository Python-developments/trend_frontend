class FacebookSignInResponseModel {
  final String token, tokenType, email;
  FacebookSignInResponseModel(
      {required this.token, required this.tokenType, required this.email});

  Map<String, dynamic> toJson() => {
        'token': token,
        'tokenType': tokenType,
      };
}
