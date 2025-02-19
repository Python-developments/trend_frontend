// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'liked_users_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LikedUsersModel _$LikedUsersModelFromJson(Map<String, dynamic> json) =>
    LikedUsersModel(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
    );

Map<String, dynamic> _$LikedUsersModelToJson(LikedUsersModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
    };
