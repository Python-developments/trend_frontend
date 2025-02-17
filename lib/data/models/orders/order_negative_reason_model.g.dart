// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_negative_reason_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderNegativeReasonModel _$OrderNegativeReasonModelFromJson(
        Map<String, dynamic> json) =>
    OrderNegativeReasonModel(
      title: json['title'] as String? ?? '',
      id: json['_id'] as String,
      needImage: json['requiresImage'] as bool? ?? false,
      isComplaintReason: json['convertToComplain'] as bool? ?? false,
    );

Map<String, dynamic> _$OrderNegativeReasonModelToJson(
        OrderNegativeReasonModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.title,
      'requiresImage': instance.needImage,
      'convertToComplain': instance.isComplaintReason,
    };
