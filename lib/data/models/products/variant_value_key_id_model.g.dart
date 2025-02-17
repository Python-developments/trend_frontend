// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'variant_value_key_id_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VariantValueKeyIdModel _$VariantValueKeyIdModelFromJson(
        Map<String, dynamic> json) =>
    VariantValueKeyIdModel(
      valueName: json['name'] as String? ?? 'name',
      keyId: json['attributeId'] as String,
    );

Map<String, dynamic> _$VariantValueKeyIdModelToJson(
        VariantValueKeyIdModel instance) =>
    <String, dynamic>{
      'name': instance.valueName,
      'attributeId': instance.keyId,
    };
