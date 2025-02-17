import 'package:json_annotation/json_annotation.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/models/core/base_model.dart';
import 'package:trend/data/models/core/file_response_model.dart';
import 'package:trend/data/models/orders/order_status_history_model.dart';
import 'package:trend/data/models/orders/order_summary_model.dart';
import 'package:trend/data/models/orders/review_model.dart';

import 'package:trend/core/utils/global.dart';

part 'order_model.g.dart';

@JsonSerializable()
class OrderModel extends BaseModel {
  @JsonKey(name: 'shopName',defaultValue: Global.generateDefaultValue ? 'Shop Name':null)
  final String vendorName;
  @JsonKey(name: 'summary')
  final OrderSummaryModel orderSummary;
  @JsonKey(name: 'oId',defaultValue: Global.generateDefaultValue ? '1':null)
  final String orderNumber;
  @JsonKey(name: 'status',defaultValue: Global.generateDefaultValue ? OrderStatus.preparing:null)
  final OrderStatus orderStatus;
  @JsonKey(defaultValue: Global.generateDefaultValue ? Global.defaultDateTime:null)
  final DateTime createdAt;
  final DateTime? estimatedDeliveryTime;
  @JsonKey(name: 'originalLogo')
  final FileResponseModel? vendorLogo;
  @JsonKey(defaultValue: Global.generateDefaultValue ? OrderType.onDemandDelivery:null)
  final OrderType orderType;
  final ReviewModel? review;

  @JsonKey(name: 'orderHistory',defaultValue: Global.generateDefaultValue ? []:null)
  final List<OrderStatusHistoryModel> orderStatusHistory;

  OrderModel(
      {required super.id,
      required this.orderStatus,
      required this.vendorLogo,
      required this.orderType,
      required this.createdAt,
      required this.vendorName,
      required this.orderNumber,
      required this.orderStatusHistory,
      required this.review,
      required this.orderSummary,
      required this.estimatedDeliveryTime});

  factory OrderModel.fromJson(final Map<String, dynamic> data) =>
      _$OrderModelFromJson(data);

}
