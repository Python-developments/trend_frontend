// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_profile_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateProfileDto _$UpdateProfileDtoFromJson(Map<String, dynamic> json) =>
    UpdateProfileDto(
      name: json['name'] as String?,
      birthday:
          json['DOB'] == null ? null : DateTime.parse(json['DOB'] as String),
      genderType: $enumDecodeNullable(_$GenderTypeEnumMap, json['gender']),
      phoneNumber: json['phoneNumber'] as String?,
    );

Map<String, dynamic> _$UpdateProfileDtoToJson(UpdateProfileDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'phoneNumber': instance.phoneNumber,
      'DOB': instance.birthday?.toIso8601String(),
      'gender': _$GenderTypeEnumMap[instance.genderType],
    };

const _$GenderTypeEnumMap = {
  GenderType.male: 'Male',
  GenderType.female: 'Female',
};
