// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_summary_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderSummaryModel _$OrderSummaryModelFromJson(Map<String, dynamic> json) =>
    OrderSummaryModel(
      totalPrice: json['totalPrice'] as num,
      subtotalPrice: json['subTotalPrice'] as num,
      orderDeliveryDetails: json['deliveryBy'] == null
          ? OrderDeliveryDetailsModel.pickup()
          : OrderDeliveryDetailsModel.fromJson(
              json['deliveryBy'] as Map<String, dynamic>),
      discountAmount: json['discount'] as num? ?? 0.0,
      platformFee: json['platformFee'] as num,
      deliveryFee: json['deliveryFee'] as num,
      couponAmount: json['couponPrice'] as num? ?? 0.0,
    );

Map<String, dynamic> _$OrderSummaryModelToJson(OrderSummaryModel instance) =>
    <String, dynamic>{
      'totalPrice': instance.totalPrice,
      'platformFee': instance.platformFee,
      'deliveryFee': instance.deliveryFee,
      'subTotalPrice': instance.subtotalPrice,
      'discount': instance.discountAmount,
      'couponPrice': instance.couponAmount,
      'deliveryBy': instance.orderDeliveryDetails.toJson(),
    };
