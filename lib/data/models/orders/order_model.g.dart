// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderModel _$OrderModelFromJson(Map<String, dynamic> json) => OrderModel(
      id: json['_id'] as String,
      orderStatus: $enumDecodeNullable(_$OrderStatusEnumMap, json['status']) ??
          OrderStatus.preparing,
      vendorLogo: json['originalLogo'] == null
          ? null
          : FileResponseModel.fromJson(
              json['originalLogo'] as Map<String, dynamic>),
      orderType: $enumDecodeNullable(_$OrderTypeEnumMap, json['orderType']) ??
          OrderType.onDemandDelivery,
      createdAt: json['createdAt'] == null
          ? Global.defaultDateTime()
          : DateTime.parse(json['createdAt'] as String),
      vendorName: json['shopName'] as String? ?? 'Shop Name',
      orderNumber: json['oId'] as String? ?? '1',
      orderStatusHistory: (json['orderHistory'] as List<dynamic>?)
              ?.map((e) =>
                  OrderStatusHistoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      review: json['review'] == null
          ? null
          : ReviewModel.fromJson(json['review'] as Map<String, dynamic>),
      orderSummary:
          OrderSummaryModel.fromJson(json['summary'] as Map<String, dynamic>),
      estimatedDeliveryTime: json['estimatedDeliveryTime'] == null
          ? null
          : DateTime.parse(json['estimatedDeliveryTime'] as String),
    );

Map<String, dynamic> _$OrderModelToJson(OrderModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'shopName': instance.vendorName,
      'summary': instance.orderSummary.toJson(),
      'oId': instance.orderNumber,
      'status': _$OrderStatusEnumMap[instance.orderStatus]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'estimatedDeliveryTime':
          instance.estimatedDeliveryTime?.toIso8601String(),
      'originalLogo': instance.vendorLogo?.toJson(),
      'orderType': _$OrderTypeEnumMap[instance.orderType]!,
      'review': instance.review?.toJson(),
      'orderHistory':
          instance.orderStatusHistory.map((e) => e.toJson()).toList(),
    };

const _$OrderStatusEnumMap = {
  OrderStatus.draft: 'draft',
  OrderStatus.pendingPayment: 'pendingPayment',
  OrderStatus.paymentFailed: 'paymentFailed',
  OrderStatus.pendingRejectionApproval: 'pendingRejectionApproval',
  OrderStatus.pendingShopApproval: 'pendingShopApproval',
  OrderStatus.scheduled: 'scheduled',
  OrderStatus.preparing: 'preparing',
  OrderStatus.readyForPickup: 'readyForPickup',
  OrderStatus.outForDelivery: 'outForDelivery',
  OrderStatus.completed: 'completed',
  OrderStatus.canceled: 'canceled',
  OrderStatus.rejected: 'rejected',
};

const _$OrderTypeEnumMap = {
  OrderType.onDemandDelivery: 'onDemandDelivery',
  OrderType.pickUp: 'pickUp',
  OrderType.scheduledDelivery: 'scheduledDelivery',
};
