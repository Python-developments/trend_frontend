// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtering_variant_key_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FilteringVariantKeyModel _$FilteringVariantKeyModelFromJson(
        Map<String, dynamic> json) =>
    FilteringVariantKeyModel(
      keyName: json['attributeShowName'] as String? ?? 'attribute',
      variantValues: (json['values'] as List<dynamic>?)
              ?.map((e) => FilteringVariantValueModel.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$FilteringVariantKeyModelToJson(
        FilteringVariantKeyModel instance) =>
    <String, dynamic>{
      'attributeShowName': instance.keyName,
      'values': instance.variantValues.map((e) => e.toJson()).toList(),
    };
