// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutDto _$CheckoutDtoFromJson(Map<String, dynamic> json) => CheckoutDto(
      cartId: json['cartId'] as String,
      orderType: $enumDecode(_$OrderTypeEnumMap, json['orderType']),
      couponCode: json['couponCode'] as String?,
      orderCard: json['card'] == null
          ? null
          : OrderCardDto.fromJson(json['card'] as Map<String, dynamic>),
      recipientName: json['recipientName'] as String?,
      recipientPhoneNumber: json['recipientPhone'] as String?,
      address: AddressDto.fromJson(json['address'] as Map<String, dynamic>),
      schedulingDate: json['schedulingDate'] == null
          ? null
          : DateTime.parse(json['schedulingDate'] as String),
      paymentDetails: PaymentDetailsDto.fromJson(
          json['paymentDetails'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CheckoutDtoToJson(CheckoutDto instance) =>
    <String, dynamic>{
      'cartId': instance.cartId,
      'orderType': _$OrderTypeEnumMap[instance.orderType]!,
      'couponCode': instance.couponCode,
      'recipientName': instance.recipientName,
      'recipientPhone': instance.recipientPhoneNumber,
      'paymentDetails': instance.paymentDetails.toJson(),
      'card': instance.orderCard?.toJson(),
      'address': instance.address.toJson(),
      'schedulingDate': instance.schedulingDate?.toIso8601String(),
    };

const _$OrderTypeEnumMap = {
  OrderType.onDemandDelivery: 'onDemandDelivery',
  OrderType.pickUp: 'pickUp',
  OrderType.scheduledDelivery: 'scheduledDelivery',
};
