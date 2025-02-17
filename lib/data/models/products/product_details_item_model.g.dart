// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsItemModel _$ProductDetailsItemModelFromJson(
        Map<String, dynamic> json) =>
    ProductDetailsItemModel(
      variantValues: (json['attributes'] as List<dynamic>?)
              ?.map((e) =>
                  VariantValueKeyIdModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      sellingPrice: (json['sellingPrice'] as num?)?.toDouble() ?? 10000.0,
      variantId: json['pId'] as String,
      stockStatus: $enumDecodeNullable(
              _$ProductStockStatusEnumMap, json['stockStatus']) ??
          ProductStockStatus.outOfStock,
      itemDescription: json['itemDescription'] as String?,
      slashPrice: (json['slashPrice'] as num?)?.toDouble(),
      images: (json['images'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      skuNumber: json['sku'] as String?,
    );

Map<String, dynamic> _$ProductDetailsItemModelToJson(
        ProductDetailsItemModel instance) =>
    <String, dynamic>{
      'pId': instance.variantId,
      'attributes': instance.variantValues.map((e) => e.toJson()).toList(),
      'slashPrice': instance.slashPrice,
      'sellingPrice': instance.sellingPrice,
      'images': instance.images,
      'sku': instance.skuNumber,
      'itemDescription': instance.itemDescription,
      'stockStatus': _$ProductStockStatusEnumMap[instance.stockStatus]!,
    };

const _$ProductStockStatusEnumMap = {
  ProductStockStatus.inStock: 'InStock',
  ProductStockStatus.outOfStock: 'OutOfStock',
};
