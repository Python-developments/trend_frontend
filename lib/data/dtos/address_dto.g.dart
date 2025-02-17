// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressDto _$AddressDtoFromJson(Map<String, dynamic> json) => AddressDto(
      title: json['title'] as String,
      area: json['area'] as String,
      addressDescription: json['addressDescription'] as String,
      additionalInfo: json['additionalInfo'] as String?,
      location:
          LocationModel.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressDtoToJson(AddressDto instance) =>
    <String, dynamic>{
      'title': instance.title,
      'area': instance.area,
      'addressDescription': instance.addressDescription,
      'additionalInfo': instance.additionalInfo,
      'location': instance.location.toJson(),
    };
