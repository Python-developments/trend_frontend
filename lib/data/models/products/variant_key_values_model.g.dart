// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant_key_values_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VariantKeyValuesModel _$VariantKeyValuesModelFromJson(
        Map<String, dynamic> json) =>
    VariantKeyValuesModel(
      id: json['_id'] as String,
      keyName: json['showName'] as String? ?? 'name',
      values: (json['values'] as List<dynamic>?)
              ?.map(
                  (e) => VariantValueModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$VariantKeyValuesModelToJson(
        VariantKeyValuesModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'showName': instance.keyName,
      'values': instance.values.map((e) => e.toJson()).toList(),
    };
