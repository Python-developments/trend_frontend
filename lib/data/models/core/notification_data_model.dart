import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trend/core/utils/enums.dart';

import 'package:trend/core/utils/global.dart';

part 'notification_data_model.freezed.dart';
part 'notification_data_model.g.dart';

@Freezed(unionKey: 'topic')
class NotificationDataModel with _$NotificationDataModel {
  const NotificationDataModel._();

  factory NotificationDataModel.product({required final String productId}) =
      _Product;
  factory NotificationDataModel.vendor({required final String vendorId}) =
      _Vendor;
  factory NotificationDataModel.order(
      {
        required final String orderId,
        @JsonKey(name: 'oId',defaultValue:Global.generateDefaultValue ? '1':null)
        required final String orderNumber,
      @JsonKey(name: 'event',defaultValue:Global.generateDefaultValue ? OrderNotificationType.orderPreparing:null)
      required final OrderNotificationType notificationType,
        @JsonKey(name: 'status',defaultValue:Global.generateDefaultValue ? OrderStatus.preparing:null)
        required final OrderStatus orderStatus,
        @JsonKey(defaultValue:Global.generateDefaultValue ?Global.defaultDateTime:null)
        required final DateTime estimatedDeliveryTime,
      @JsonKey(name: 'shopName',defaultValue:Global.generateDefaultValue ?'Shop Name':null)
      required final String vendorName,
        @JsonKey(defaultValue:Global.generateDefaultValue ?OrderType.onDemandDelivery:null)
        required final OrderType orderType,
      @JsonKey(name:'fulfilledBy',defaultValue:Global.generateDefaultValue ?OrderDeliveryBy.Vendor:null)
      required final OrderDeliveryBy orderDeliveryBy,
     @JsonKey(name:'mainCategory',defaultValue:Global.generateDefaultValue ?CategoryExtension.CK:null)
      required final CategoryExtension categoryExtension,

      }) = _Order;
  factory NotificationDataModel.event({required final String eventId}) = _Event;
  factory NotificationDataModel.cart() = _Cart;
  factory NotificationDataModel.fromJson(final Map<String, dynamic> data) =>
      _$NotificationDataModelFromJson(data);
}
