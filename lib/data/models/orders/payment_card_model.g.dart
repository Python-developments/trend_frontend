// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'payment_card_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaymentCardModel _$PaymentCardModelFromJson(Map<String, dynamic> json) =>
    PaymentCardModel(
      id: json['id'] as String,
      cardDetails: PaymentCardDetailsModel.fromJson(
          json['card'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$PaymentCardModelToJson(PaymentCardModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'card': instance.cardDetails.toJson(),
    };
