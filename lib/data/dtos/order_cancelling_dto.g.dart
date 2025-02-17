// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_cancelling_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderCancellingDto _$OrderCancellingDtoFromJson(Map<String, dynamic> json) =>
    OrderCancellingDto(
      reasonId: json['tag'] as String,
      notes: json['comment'] as String?,
    );

Map<String, dynamic> _$OrderCancellingDtoToJson(OrderCancellingDto instance) =>
    <String, dynamic>{
      'tag': instance.reasonId,
      'comment': instance.notes,
    };
