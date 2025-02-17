// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_card_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentCardDetailsModel _$PaymentCardDetailsModelFromJson(
        Map<String, dynamic> json) =>
    PaymentCardDetailsModel(
      lastFourDigits: json['last4'] as String? ?? '0000',
      cardType: json['brand'] as String? ?? '',
    );

Map<String, dynamic> _$PaymentCardDetailsModelToJson(
        PaymentCardDetailsModel instance) =>
    <String, dynamic>{
      'last4': instance.lastFourDigits,
      'brand': instance.cardType,
    };
