// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_vendor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderVendorModel _$OrderVendorModelFromJson(Map<String, dynamic> json) =>
    OrderVendorModel(
      vendorName: json['shopName'] as String? ?? '',
      location:
          LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      vendorLogo: json['originalLogo'] == null
          ? null
          : FileResponseModel.fromJson(
              json['originalLogo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$OrderVendorModelToJson(OrderVendorModel instance) =>
    <String, dynamic>{
      'shopName': instance.vendorName,
      'location': instance.location.toJson(),
      'originalLogo': instance.vendorLogo?.toJson(),
    };
