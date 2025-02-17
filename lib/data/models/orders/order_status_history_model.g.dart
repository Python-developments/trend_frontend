// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_status_history_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

OrderStatusHistoryModel _$OrderStatusHistoryModelFromJson(
        Map<String, dynamic> json) =>
    OrderStatusHistoryModel(
      status: $enumDecodeNullable(_$OrderStatusEnumMap, json['status']) ??
          OrderStatus.preparing,
    );

Map<String, dynamic> _$OrderStatusHistoryModelToJson(
        OrderStatusHistoryModel instance) =>
    <String, dynamic>{
      'status': _$OrderStatusEnumMap[instance.status]!,
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
