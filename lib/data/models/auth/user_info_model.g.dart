// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserInfoModel _$UserInfoModelFromJson(Map<String, dynamic> json) =>
    UserInfoModel(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      email: json['email'] as String,
      followers: (json['followers'] as num).toInt(),
      following: (json['following'] as num).toInt(),
      totalPosts: (json['total_posts'] as num).toInt(),
      totalLikes: (json['total_likes'] as num).toInt(),
      profile:
          UserProfileModel.fromJson(json['profile'] as Map<String, dynamic>),
      fullName: json['full_name'] as String?,
      avatar: json['avatar'] as String?,
    );

Map<String, dynamic> _$UserInfoModelToJson(UserInfoModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'full_name': instance.fullName,
      'avatar': instance.avatar,
      'followers': instance.followers,
      'following': instance.following,
      'total_posts': instance.totalPosts,
      'total_likes': instance.totalLikes,
      'profile': instance.profile.toJson(),
    };
