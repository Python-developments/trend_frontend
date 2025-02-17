// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductModel _$ProductModelFromJson(Map<String, dynamic> json) => ProductModel(
      id: json['_id'] as String,
      originalPrice: (json['sellingPrice'] as num?)?.toDouble() ?? 10000.0,
      subtitle: json['subTitle'] as String?,
      stockStatus: $enumDecodeNullable(
              _$ProductStockStatusEnumMap, json['stockStatus']) ??
          ProductStockStatus.outOfStock,
      name: json['name'] as String? ?? 'Unknown',
      imageUrl: json['mainImage'] as String?,
      discountPrice: (json['slashPrice'] as num?)?.toDouble(),
      initialItemIndex: (json['selectedItemIndex'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$ProductModelToJson(ProductModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'sellingPrice': instance.originalPrice,
      'name': instance.name,
      'mainImage': instance.imageUrl,
      'slashPrice': instance.discountPrice,
      'subTitle': instance.subtitle,
      'stockStatus': _$ProductStockStatusEnumMap[instance.stockStatus]!,
      'selectedItemIndex': instance.initialItemIndex,
    };

const _$ProductStockStatusEnumMap = {
  ProductStockStatus.inStock: 'InStock',
  ProductStockStatus.outOfStock: 'OutOfStock',
};
