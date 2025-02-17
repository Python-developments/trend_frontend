// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_item_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartItemDto _$CartItemDtoFromJson(Map<String, dynamic> json) => CartItemDto(
      quantity: (json['quantity'] as num).toInt(),
      notes: json['notes'] as String?,
      customImage: json['customizationFile'] as String?,
      variantId: json['productItemPId'] as String,
    );

Map<String, dynamic> _$CartItemDtoToJson(CartItemDto instance) =>
    <String, dynamic>{
      'productItemPId': instance.variantId,
      'quantity': instance.quantity,
      'notes': instance.notes,
      'customizationFile': instance.customImage,
    };
