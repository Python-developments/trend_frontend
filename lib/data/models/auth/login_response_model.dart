import 'package:json_annotation/json_annotation.dart';
import 'package:trend/data/models/auth/tokens_model.dart';
import 'package:trend/data/models/auth/user_info_model.dart';

part 'login_response_model.g.dart';

@JsonSerializable()
class LoginResponseModel {
  @JsonKey(name: 'token')
  final TokensModel tokens;
  @JsonKey(name: 'user_info')
  final UserInfoModel user;
  LoginResponseModel({
    required this.tokens,
    required this.user,
  });

  factory LoginResponseModel.fromJson(final Map<String, dynamic> data) =>
      _$LoginResponseModelFromJson(data);

}
