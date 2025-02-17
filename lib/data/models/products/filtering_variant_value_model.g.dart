// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtering_variant_value_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilteringVariantValueModel _$FilteringVariantValueModelFromJson(
        Map<String, dynamic> json) =>
    FilteringVariantValueModel(
      id: json['attributeValueId'] as String,
      valueName:
          json['attributeValueName'] as String? ?? 'attribute value name',
      matchedProductsCount: (json['attributeValueCount'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$FilteringVariantValueModelToJson(
        FilteringVariantValueModel instance) =>
    <String, dynamic>{
      'attributeValueId': instance.id,
      'attributeValueName': instance.valueName,
      'attributeValueCount': instance.matchedProductsCount,
    };
