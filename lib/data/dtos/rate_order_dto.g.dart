// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'rate_order_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RateOrderDto _$RateOrderDtoFromJson(Map<String, dynamic> json) => RateOrderDto(
      orderId: json['orderId'] as String,
      orderRating: (json['orderRating'] as num).toInt(),
      deliveryRating: (json['deliveryRating'] as num).toInt(),
      vendorNote: json['commentOnVendor'] as String?,
      deliveryNote: json['commentOnDelivery'] as String?,
    );

Map<String, dynamic> _$RateOrderDtoToJson(RateOrderDto instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'orderRating': instance.orderRating,
      'deliveryRating': instance.deliveryRating,
      'commentOnVendor': instance.vendorNote,
      'commentOnDelivery': instance.deliveryNote,
    };
