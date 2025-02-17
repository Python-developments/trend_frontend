import 'package:json_annotation/json_annotation.dart';
import 'package:trend/data/models/auth/user_profile_model.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  @JsonKey(name: 'access_token')
  final String token;
  final UserProfileModel user;
  LoginResponseModel({
    required this.token,
    required this.user,
  });

  factory LoginResponseModel.fromJson(final Map<String, dynamic> data) =>
      _$LoginResponseModelFromJson(data);

  factory LoginResponseModel.empty() =>
      LoginResponseModel(token: 'token', user: UserProfileModel.empty());
}
