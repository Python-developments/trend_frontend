// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CartModel _$CartModelFromJson(Map<String, dynamic> json) => CartModel(
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      vendorId: json['shopId'] as String?,
      vendorStatus:
          $enumDecodeNullable(_$VendorStatusEnumMap, json['shopStatus']),
      allowedOrderTypes: (json['availableFulfillmentMethods'] as List<dynamic>?)
              ?.map((e) => $enumDecode(_$OrderTypeEnumMap, e))
              .toList() ??
          [],
      allowCashOnDelivery: json['acceptCOD'] as bool? ?? false,
      id: json['_id'] as String,
      vendorName: json['shopName'] as String?,
      minimumOrderValue:
          (json['minimumOrderAmount'] as num?)?.toDouble() ?? 250.0,
      startSchedulingDate: json['startSchedulingDate'] == null
          ? Global.defaultDateTime()
          : DateTime.parse(json['startSchedulingDate'] as String),
    );

Map<String, dynamic> _$CartModelToJson(CartModel instance) => <String, dynamic>{
      '_id': instance.id,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'minimumOrderAmount': instance.minimumOrderValue,
      'shopId': instance.vendorId,
      'startSchedulingDate': instance.startSchedulingDate.toIso8601String(),
      'availableFulfillmentMethods': instance.allowedOrderTypes
          .map((e) => _$OrderTypeEnumMap[e]!)
          .toList(),
      'acceptCOD': instance.allowCashOnDelivery,
      'shopStatus': _$VendorStatusEnumMap[instance.vendorStatus],
      'shopName': instance.vendorName,
    };

const _$VendorStatusEnumMap = {
  VendorStatus.OPEN: 'OPEN',
  VendorStatus.CLOSED: 'CLOSED',
  VendorStatus.BUSY_30_MIN: 'BUSY_30_MIN',
  VendorStatus.BUSY_60_MIN: 'BUSY_60_MIN',
};

const _$OrderTypeEnumMap = {
  OrderType.onDemandDelivery: 'onDemandDelivery',
  OrderType.pickUp: 'pickUp',
  OrderType.scheduledDelivery: 'scheduledDelivery',
};
