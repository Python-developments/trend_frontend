// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'creating_order_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CreatingOrderResponseModel _$CreatingOrderResponseModelFromJson(
        Map<String, dynamic> json) =>
    CreatingOrderResponseModel(
      orderId: json['orderId'] as String,
      checkoutPageLink: json['checkoutPage'] as String?,
    );

Map<String, dynamic> _$CreatingOrderResponseModelToJson(
        CreatingOrderResponseModel instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'checkoutPage': instance.checkoutPageLink,
    };
