// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tokens_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TokensModel _$TokensModelFromJson(Map<String, dynamic> json) => TokensModel(
      refreshToken: json['refresh'] as String,
      accessToken: json['access'] as String,
    );

Map<String, dynamic> _$TokensModelToJson(TokensModel instance) =>
    <String, dynamic>{
      'refresh': instance.refreshToken,
      'access': instance.accessToken,
    };
