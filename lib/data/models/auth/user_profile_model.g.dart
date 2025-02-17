// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfileModel _$UserProfileModelFromJson(Map<String, dynamic> json) =>
    UserProfileModel(
      name: json['name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      referralCode: json['referralCode'] as String? ?? 'ref',
      isSocialLogin: json['isSocialLogin'] as bool? ?? false,
      isPhoneVerified: json['isPhoneVerified'] as bool? ?? false,
      isEmailVerified: json['isEmailVerified'] as bool? ?? false,
      lastUnratedOrderId: json['lastOrderNotRated'] as String?,
      language: json['language'] as String? ?? 'en',
      addresses: (json['addresses'] as List<dynamic>?)
              ?.map((e) => AddressModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      birthday:
          json['DOB'] == null ? null : DateTime.parse(json['DOB'] as String),
      phoneNumber: json['phoneNumber'] as String?,
      genderType: $enumDecodeNullable(_$GenderTypeEnumMap, json['gender']),
    );

Map<String, dynamic> _$UserProfileModelToJson(UserProfileModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'referralCode': instance.referralCode,
      'language': instance.language,
      'DOB': instance.birthday?.toIso8601String(),
      'phoneNumber': instance.phoneNumber,
      'lastOrderNotRated': instance.lastUnratedOrderId,
      'gender': _$GenderTypeEnumMap[instance.genderType],
      'isPhoneVerified': instance.isPhoneVerified,
      'isEmailVerified': instance.isEmailVerified,
      'isSocialLogin': instance.isSocialLogin,
      'addresses': instance.addresses.map((e) => e.toJson()).toList(),
    };

const _$GenderTypeEnumMap = {
  GenderType.male: 'Male',
  GenderType.female: 'Female',
};
