// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'short_vendor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ShortVendorModel _$ShortVendorModelFromJson(Map<String, dynamic> json) =>
    ShortVendorModel(
      id: json['_id'] as String,
      name: json['shopName'] as String? ?? 'Shop Name',
      slug: json['slug'] as String? ?? 'slug',
    );

Map<String, dynamic> _$ShortVendorModelToJson(ShortVendorModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'shopName': instance.name,
      'slug': instance.slug,
    };
