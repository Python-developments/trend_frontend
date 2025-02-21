// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponseModel _$LoginResponseModelFromJson(Map<String, dynamic> json) =>
    LoginResponseModel(
      tokens: TokensModel.fromJson(json['token'] as Map<String, dynamic>),
      user: UserInfoModel.fromJson(json['user_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$LoginResponseModelToJson(LoginResponseModel instance) =>
    <String, dynamic>{
      'token': instance.tokens.toJson(),
      'user_info': instance.user.toJson(),
    };
