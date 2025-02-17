// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_data_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ProductImpl _$$ProductImplFromJson(Map<String, dynamic> json) =>
    _$ProductImpl(
      productId: json['productId'] as String,
      $type: json['topic'] as String?,
    );

Map<String, dynamic> _$$ProductImplToJson(_$ProductImpl instance) =>
    <String, dynamic>{
      'productId': instance.productId,
      'topic': instance.$type,
    };

_$VendorImpl _$$VendorImplFromJson(Map<String, dynamic> json) => _$VendorImpl(
      vendorId: json['vendorId'] as String,
      $type: json['topic'] as String?,
    );

Map<String, dynamic> _$$VendorImplToJson(_$VendorImpl instance) =>
    <String, dynamic>{
      'vendorId': instance.vendorId,
      'topic': instance.$type,
    };

_$OrderImpl _$$OrderImplFromJson(Map<String, dynamic> json) => _$OrderImpl(
      orderId: json['orderId'] as String,
      orderNumber: json['oId'] as String? ?? '1',
      notificationType:
          $enumDecodeNullable(_$OrderNotificationTypeEnumMap, json['event']) ??
              OrderNotificationType.orderPreparing,
      orderStatus: $enumDecodeNullable(_$OrderStatusEnumMap, json['status']) ??
          OrderStatus.preparing,
      estimatedDeliveryTime: json['estimatedDeliveryTime'] == null
          ? Global.defaultDateTime()
          : DateTime.parse(json['estimatedDeliveryTime'] as String),
      vendorName: json['shopName'] as String? ?? 'Shop Name',
      orderType: $enumDecodeNullable(_$OrderTypeEnumMap, json['orderType']) ??
          OrderType.onDemandDelivery,
      orderDeliveryBy:
          $enumDecodeNullable(_$OrderDeliveryByEnumMap, json['fulfilledBy']) ??
              OrderDeliveryBy.Vendor,
      categoryExtension: $enumDecodeNullable(
              _$CategoryExtensionEnumMap, json['mainCategory']) ??
          CategoryExtension.CK,
      $type: json['topic'] as String?,
    );

Map<String, dynamic> _$$OrderImplToJson(_$OrderImpl instance) =>
    <String, dynamic>{
      'orderId': instance.orderId,
      'oId': instance.orderNumber,
      'event': _$OrderNotificationTypeEnumMap[instance.notificationType]!,
      'status': _$OrderStatusEnumMap[instance.orderStatus]!,
      'estimatedDeliveryTime': instance.estimatedDeliveryTime.toIso8601String(),
      'shopName': instance.vendorName,
      'orderType': _$OrderTypeEnumMap[instance.orderType]!,
      'fulfilledBy': _$OrderDeliveryByEnumMap[instance.orderDeliveryBy]!,
      'mainCategory': _$CategoryExtensionEnumMap[instance.categoryExtension]!,
      'topic': instance.$type,
    };

const _$OrderNotificationTypeEnumMap = {
  OrderNotificationType.orderPlaced: 'orderPlaced',
  OrderNotificationType.orderPreparing: 'orderPreparing',
  OrderNotificationType.orderOutForDelivery: 'orderOutForDelivery',
  OrderNotificationType.orderCompleted: 'orderCompleted',
  OrderNotificationType.orderCanceled: 'orderCanceled',
  OrderNotificationType.orderScheduleConfirmed: 'orderScheduleConfirmed',
  OrderNotificationType.orderPickupConfirmed: 'orderPickupConfirmed',
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

const _$OrderDeliveryByEnumMap = {
  OrderDeliveryBy.WowVir: 'WowVir',
  OrderDeliveryBy.Vendor: 'Vendor',
  OrderDeliveryBy.pickUp: 'pickUp',
};

const _$CategoryExtensionEnumMap = {
  CategoryExtension.FL: 'FL',
  CategoryExtension.CK: 'CK',
  CategoryExtension.CH: 'CH',
  CategoryExtension.PR: 'PR',
};

_$EventImpl _$$EventImplFromJson(Map<String, dynamic> json) => _$EventImpl(
      eventId: json['eventId'] as String,
      $type: json['topic'] as String?,
    );

Map<String, dynamic> _$$EventImplToJson(_$EventImpl instance) =>
    <String, dynamic>{
      'eventId': instance.eventId,
      'topic': instance.$type,
    };

_$CartImpl _$$CartImplFromJson(Map<String, dynamic> json) => _$CartImpl(
      $type: json['topic'] as String?,
    );

Map<String, dynamic> _$$CartImplToJson(_$CartImpl instance) =>
    <String, dynamic>{
      'topic': instance.$type,
    };
