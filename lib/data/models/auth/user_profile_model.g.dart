// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    UserProfileModel(
      isPrivate: json['is_private'] as bool,
      verified: json['verified'] as bool,
      isBusiness: json['is_business'] as bool,
      isSuspended: json['is_suspended'] as bool,
      bio: json['bio'] as String?,
      mobile: json['mobile'] as String?,
    );

Map<String, dynamic> _$UserProfileModelToJson(UserProfileModel instance) =>
    <String, dynamic>{
      'bio': instance.bio,
      'mobile': instance.mobile,
      'is_private': instance.isPrivate,
      'verified': instance.verified,
      'is_business': instance.isBusiness,
      'is_suspended': instance.isSuspended,
    };
