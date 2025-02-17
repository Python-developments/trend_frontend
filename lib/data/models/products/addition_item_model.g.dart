// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'addition_item_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AdditionItemModelImpl _$$AdditionItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$AdditionItemModelImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      price: (json['price'] as num).toDouble(),
    );

Map<String, dynamic> _$$AdditionItemModelImplToJson(
        _$AdditionItemModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'price': instance.price,
    };
