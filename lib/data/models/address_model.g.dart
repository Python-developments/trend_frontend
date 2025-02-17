// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'address_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddressModel _$AddressModelFromJson(Map<String, dynamic> json) => AddressModel(
      id: json['_id'] as String,
      title: json['title'] as String? ?? '',
      area: json['area'] as String? ?? '',
      additionalInfo: json['additionalInfo'] as String?,
      addressDescription: json['addressDescription'] as String? ?? '',
      location:
          LocationModel.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$AddressModelToJson(AddressModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'area': instance.area,
      'addressDescription': instance.addressDescription,
      'additionalInfo': instance.additionalInfo,
      'location': instance.location.toJson(),
    };
