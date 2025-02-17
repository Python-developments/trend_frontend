// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderDetailsModel _$OrderDetailsModelFromJson(Map<String, dynamic> json) =>
    OrderDetailsModel(
      id: json['_id'] as String,
      items: (json['items'] as List<dynamic>?)
              ?.map((e) => CartItemModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      review: json['review'] == null
          ? null
          : ReviewModel.fromJson(json['review'] as Map<String, dynamic>),
      cancellationRequest: json['request'],
      rejectionReason: json['rejectionReason'] as String?,
      orderType: $enumDecodeNullable(_$OrderTypeEnumMap, json['orderType']) ??
          OrderType.onDemandDelivery,
      vendor: OrderVendorModel.fromJson(json['shop'] as Map<String, dynamic>),
      orderNumber: json['oId'] as String? ?? '1',
      isEPayment: json['isElectronicPayment'] as bool? ?? false,
      orderStatus: $enumDecodeNullable(_$OrderStatusEnumMap, json['status']) ??
          OrderStatus.preparing,
      createdAt: json['createdAt'] == null
          ? Global.defaultDateTime()
          : DateTime.parse(json['createdAt'] as String),
      schedulingDate: json['schedulingDate'] == null
          ? null
          : DateTime.parse(json['schedulingDate'] as String),
      estimatedDeliveryTime: json['estimatedDeliveryTime'] == null
          ? null
          : DateTime.parse(json['estimatedDeliveryTime'] as String),
      orderSummary:
          OrderSummaryModel.fromJson(json['summary'] as Map<String, dynamic>),
      orderAddress:
          AddressModel.fromJson(json['address'] as Map<String, dynamic>),
      orderStatusHistory: (json['orderHistory'] as List<dynamic>?)
              ?.map((e) =>
                  OrderStatusHistoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$OrderDetailsModelToJson(OrderDetailsModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'items': instance.items.map((e) => e.toJson()).toList(),
      'review': instance.review?.toJson(),
      'summary': instance.orderSummary.toJson(),
      'rejectionReason': instance.rejectionReason,
      'orderType': _$OrderTypeEnumMap[instance.orderType]!,
      'shop': instance.vendor.toJson(),
      'oId': instance.orderNumber,
      'isElectronicPayment': instance.isEPayment,
      'status': _$OrderStatusEnumMap[instance.orderStatus]!,
      'createdAt': instance.createdAt.toIso8601String(),
      'address': instance.orderAddress.toJson(),
      'schedulingDate': instance.schedulingDate?.toIso8601String(),
      'estimatedDeliveryTime':
          instance.estimatedDeliveryTime?.toIso8601String(),
      'orderHistory':
          instance.orderStatusHistory.map((e) => e.toJson()).toList(),
      'request': instance.cancellationRequest,
    };

const _$OrderTypeEnumMap = {
  OrderType.onDemandDelivery: 'onDemandDelivery',
  OrderType.pickUp: 'pickUp',
  OrderType.scheduledDelivery: 'scheduledDelivery',
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
