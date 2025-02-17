// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_details_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentDetailsDto _$PaymentDetailsDtoFromJson(Map<String, dynamic> json) =>
    PaymentDetailsDto(
      type: json['paymentMethod'] as String,
      paymentMethodId: json['paymentMethodId'] as String?,
    );

Map<String, dynamic> _$PaymentDetailsDtoToJson(PaymentDetailsDto instance) =>
    <String, dynamic>{
      'paymentMethod': instance.type,
      'paymentMethodId': instance.paymentMethodId,
    };
