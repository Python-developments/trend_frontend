// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'join_as_vendor_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

JoinAsVendorDto _$JoinAsVendorDtoFromJson(Map<String, dynamic> json) =>
    JoinAsVendorDto(
      vendorName: json['vendorName'] as String,
      contactName: json['contactName'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      location: json['location'] as String,
      categoryId: json['mainCategory'] as String,
    );

Map<String, dynamic> _$JoinAsVendorDtoToJson(JoinAsVendorDto instance) =>
    <String, dynamic>{
      'vendorName': instance.vendorName,
      'contactName': instance.contactName,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'location': instance.location,
      'mainCategory': instance.categoryId,
    };
