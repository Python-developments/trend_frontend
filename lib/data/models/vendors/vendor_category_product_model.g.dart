// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_category_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorCategoryProductModel _$VendorCategoryProductModelFromJson(
        Map<String, dynamic> json) =>
    VendorCategoryProductModel(
      categoryId: json['categoryId'] as String,
      product: ProductModel.fromJson(json['product'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$VendorCategoryProductModelToJson(
        VendorCategoryProductModel instance) =>
    <String, dynamic>{
      'categoryId': instance.categoryId,
      'product': instance.product.toJson(),
    };
