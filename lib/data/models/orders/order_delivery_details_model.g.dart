// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_delivery_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDeliveryDetailsModel _$OrderDeliveryDetailsModelFromJson(
        Map<String, dynamic> json) =>
    OrderDeliveryDetailsModel(
      deliveryBy:
          $enumDecodeNullable(_$OrderDeliveryByEnumMap, json['deliveryBy']) ??
              OrderDeliveryBy.pickUp,
    );

Map<String, dynamic> _$OrderDeliveryDetailsModelToJson(
        OrderDeliveryDetailsModel instance) =>
    <String, dynamic>{
      'deliveryBy': _$OrderDeliveryByEnumMap[instance.deliveryBy]!,
    };

const _$OrderDeliveryByEnumMap = {
  OrderDeliveryBy.WowVir: 'WowVir',
  OrderDeliveryBy.Vendor: 'Vendor',
  OrderDeliveryBy.pickUp: 'pickUp',
};
