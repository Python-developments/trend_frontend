// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartProductModel _$CartProductModelFromJson(Map<String, dynamic> json) =>
    CartProductModel(
      id: json['_id'] as String,
      originalPrice: (json['sellingPrice'] as num?)?.toDouble() ?? 10000.0,
      subtitle: json['subTitle'] as String?,
      stockStatus: $enumDecodeNullable(
              _$ProductStockStatusEnumMap, json['stockStatus']) ??
          ProductStockStatus.outOfStock,
      name: json['name'] as String? ?? '',
      imageUrl: json['mainImage'] as String?,
      discountPrice: (json['slashPrice'] as num?)?.toDouble(),
      productVariants: (json['attributes'] as List<dynamic>?)
              ?.map((e) =>
                  VariantValueKeyIdModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$CartProductModelToJson(CartProductModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'sellingPrice': instance.originalPrice,
      'name': instance.name,
      'mainImage': instance.imageUrl,
      'slashPrice': instance.discountPrice,
      'subTitle': instance.subtitle,
      'stockStatus': _$ProductStockStatusEnumMap[instance.stockStatus]!,
      'attributes': instance.productVariants.map((e) => e.toJson()).toList(),
    };

const _$ProductStockStatusEnumMap = {
  ProductStockStatus.inStock: 'InStock',
  ProductStockStatus.outOfStock: 'OutOfStock',
};
