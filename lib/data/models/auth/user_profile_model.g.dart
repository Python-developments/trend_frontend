// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    UserProfileModel(
      id: (json['id'] as num).toInt(),
      username: json['username'] as String,
      email: json['email'] as String,
      fullName: json['full_name'] as String?,
      avatar: json['avatar'] as String?,
      bio: json['bio'] as String?,
      mobile: json['mobile'] as String?,
      followers: (json['followers'] as num).toInt(),
      following: (json['following'] as num).toInt(),
      totalPosts: (json['total_posts'] as num).toInt(),
      totalLikes: (json['total_likes'] as num).toInt(),
      isPrivate: json['is_private'] as bool,
    );

Map<String, dynamic> _$UserProfileModelToJson(UserProfileModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'email': instance.email,
      'full_name': instance.fullName,
      'avatar': instance.avatar,
      'bio': instance.bio,
      'mobile': instance.mobile,
      'followers': instance.followers,
      'following': instance.following,
      'total_posts': instance.totalPosts,
      'total_likes': instance.totalLikes,
      'is_private': instance.isPrivate,
    };
