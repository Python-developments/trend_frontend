// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductDetailsModel _$ProductDetailsModelFromJson(Map<String, dynamic> json) =>
    ProductDetailsModel(
      id: json['_id'] as String,
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      description: json['description'] as String? ?? '',
      vendor: ShortVendorModel.fromJson(json['shop'] as Map<String, dynamic>),
      isFavorite: json['isFavorite'] as bool? ?? false,
      isCustomizable: json['isCustomizable'] as bool? ?? false,
      allowCashOnDelivery: json['COD'] as bool? ?? false,
      preparationTimeValue:
          (json['preparationTimeValue'] as num?)?.toInt() ?? 0,
      subtitle: json['subtitle'] as String?,
      preparationTimeUnit: $enumDecodeNullable(
              _$ProductPreparationTimeUnitEnumMap,
              json['preparationTimeUnit']) ??
          ProductPreparationTimeUnit.minutes,
      brand: json['brand'] as String?,
      productVariants: (json['attributesList'] as List<dynamic>?)
              ?.map((e) =>
                  VariantKeyValuesModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      productItems: (json['productItems'] as List<dynamic>?)
              ?.map((e) =>
                  ProductDetailsItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      mainCategory:
          CategoryModel.fromJson(json['mainCategory'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$ProductDetailsModelToJson(
        ProductDetailsModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'slug': instance.slug,
      'shop': instance.vendor.toJson(),
      'isCustomizable': instance.isCustomizable,
      'isFavorite': instance.isFavorite,
      'COD': instance.allowCashOnDelivery,
      'preparationTimeValue': instance.preparationTimeValue,
      'preparationTimeUnit':
          _$ProductPreparationTimeUnitEnumMap[instance.preparationTimeUnit]!,
      'brand': instance.brand,
      'subtitle': instance.subtitle,
      'attributesList':
          instance.productVariants.map((e) => e.toJson()).toList(),
      'productItems': instance.productItems.map((e) => e.toJson()).toList(),
      'mainCategory': instance.mainCategory.toJson(),
    };

const _$ProductPreparationTimeUnitEnumMap = {
  ProductPreparationTimeUnit.hours: 'Hours',
  ProductPreparationTimeUnit.days: 'Days',
  ProductPreparationTimeUnit.minutes: 'Minutes',
};
