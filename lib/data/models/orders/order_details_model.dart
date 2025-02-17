import 'package:json_annotation/json_annotation.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/models/address_model.dart';
import 'package:trend/data/models/core/base_model.dart';
import 'package:trend/data/models/cart/cart_item_model.dart';
import 'package:trend/data/models/orders/order_model.dart';
import 'package:trend/data/models/orders/order_status_history_model.dart';
import 'package:trend/data/models/orders/order_summary_model.dart';
import 'package:trend/data/models/orders/order_vendor_model.dart';
import 'package:trend/data/models/orders/review_model.dart';

import 'package:trend/core/utils/global.dart';

part 'order_details_model.g.dart';

@JsonSerializable()
class OrderDetailsModel extends BaseModel {
  @JsonKey(defaultValue: Global.generateDefaultValue ? []:null)
  final List<CartItemModel> items;
  final ReviewModel? review;
  @JsonKey(name: 'summary')
  final OrderSummaryModel orderSummary;
  final String? rejectionReason;
  @JsonKey(defaultValue: Global.generateDefaultValue ? OrderType.onDemandDelivery:null)
  final OrderType orderType;
  @JsonKey(name: 'shop')
  final OrderVendorModel vendor;
  @JsonKey(name: 'oId',defaultValue: Global.generateDefaultValue ? '1':null)
  final String orderNumber;
  @JsonKey(name: 'isElectronicPayment',defaultValue: Global.generateDefaultValue ? false:null)
  final bool isEPayment;
  @JsonKey(name: 'status',defaultValue: Global.generateDefaultValue ? OrderStatus.preparing:null)
  final OrderStatus orderStatus;
  @JsonKey(defaultValue: Global.generateDefaultValue ? Global.defaultDateTime:null)
  final DateTime createdAt;
  @JsonKey(name: 'address')
  final AddressModel orderAddress;
  final DateTime? schedulingDate, estimatedDeliveryTime;
  @JsonKey(name: 'orderHistory',defaultValue: Global.generateDefaultValue ? []:null)
  final List<OrderStatusHistoryModel> orderStatusHistory;
  @JsonKey(name: 'request')
  final Object? cancellationRequest;
  OrderDetailsModel(
      {required super.id,
      required this.items,
      required this.review,
      required this.cancellationRequest,
      required this.rejectionReason,
      required this.orderType,
      required this.vendor,
      required this.orderNumber,
      required this.isEPayment,
      required this.orderStatus,
      required this.createdAt,
      required this.schedulingDate,
      required this.estimatedDeliveryTime,
      required this.orderSummary,
      required this.orderAddress,
      required this.orderStatusHistory});

  factory OrderDetailsModel.fromJson(final Map<String, dynamic> data) =>
      _$OrderDetailsModelFromJson(data);

  Map<String, dynamic> toJson() => _$OrderDetailsModelToJson(this);

  OrderModel get toOrderModel => OrderModel(
      id: id,
      orderStatus: orderStatus,
      orderType: orderType,
      vendorLogo: vendor.vendorLogo,
      createdAt: createdAt,
      vendorName: vendor.vendorName,
      orderNumber: orderNumber,
      orderStatusHistory: orderStatusHistory,
      review: review,
      orderSummary: orderSummary,
      estimatedDeliveryTime: estimatedDeliveryTime);

  factory OrderDetailsModel.empty()=>OrderDetailsModel(
      id: 'id',
      items: List.generate(3, (final _)=>CartItemModel.empty()),
      review: null,
      cancellationRequest: null,
      rejectionReason: null,
      orderType: OrderType.onDemandDelivery,
      vendor: OrderVendorModel.empty(),
      orderNumber: '',
      isEPayment: false,
      orderStatus: OrderStatus.pendingShopApproval,
      createdAt: DateTime.now(),
      schedulingDate: null,
      estimatedDeliveryTime: null,
      orderSummary: OrderSummaryModel.empty(),
      orderAddress: AddressModel.empty(),
      orderStatusHistory: []);

}
