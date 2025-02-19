// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'register_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RegisterDto _$RegisterDtoFromJson(Map<String, dynamic> json) => RegisterDto(
      username: json['username'] as String,
      email: json['email'] as String,
      confirmPassword: json['passwordConfirm'] as String,
      password: json['password'] as String,
    );

Map<String, dynamic> _$RegisterDtoToJson(RegisterDto instance) =>
    <String, dynamic>{
      'username': instance.username,
      'password': instance.password,
      'email': instance.email,
      'passwordConfirm': instance.confirmPassword,
    };
