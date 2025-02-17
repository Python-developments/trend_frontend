// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CartItemModelImpl _$$CartItemModelImplFromJson(Map<String, dynamic> json) =>
    _$CartItemModelImpl(
      id: json['_id'] as String,
      product:
          CartProductModel.fromJson(json['product'] as Map<String, dynamic>),
      quantity: (json['quantity'] as num).toInt(),
      notes: json['notes'] as String?,
      customImage: json['customizationFile'] == null
          ? null
          : FileResponseModel.fromJson(
              json['customizationFile'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$CartItemModelImplToJson(_$CartItemModelImpl instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'product': instance.product.toJson(),
      'quantity': instance.quantity,
      'notes': instance.notes,
      'customizationFile': instance.customImage?.toJson(),
    };
