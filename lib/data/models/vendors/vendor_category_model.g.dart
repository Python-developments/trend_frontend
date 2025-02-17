// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorCategoryModel _$VendorCategoryModelFromJson(Map<String, dynamic> json) =>
    VendorCategoryModel(
      id: json['id'] as String,
      name: json['name'] as String? ?? 'Category',
      productsCount: (json['productsInCategory'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$VendorCategoryModelToJson(
        VendorCategoryModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'productsInCategory': instance.productsCount,
    };
