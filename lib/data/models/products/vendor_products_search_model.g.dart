// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_products_search_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorProductSearchModel _$VendorProductSearchModelFromJson(
        Map<String, dynamic> json) =>
    VendorProductSearchModel(
      vendor: VendorModel.fromJson(json['shop'] as Map<String, dynamic>),
      products: (json['products'] as List<dynamic>?)
              ?.map((e) => ProductModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$VendorProductSearchModelToJson(
        VendorProductSearchModel instance) =>
    <String, dynamic>{
      'shop': instance.vendor.toJson(),
      'products': instance.products.map((e) => e.toJson()).toList(),
    };
