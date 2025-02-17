import 'package:json_annotation/json_annotation.dart';
import 'package:trend/data/models/orders/order_delivery_details_model.dart';

import 'package:trend/core/utils/global.dart';

part 'order_summary_model.g.dart';

@JsonSerializable()
class OrderSummaryModel {
  final num totalPrice, platformFee, deliveryFee;

  @JsonKey(name: 'subTotalPrice')
  final num subtotalPrice;

  @JsonKey(name: 'discount',defaultValue: Global.generateDefaultValue ? 0.0:null)
  final num discountAmount;

  @JsonKey(name: 'couponPrice',defaultValue: Global.generateDefaultValue ? 0.0:null)
  final num couponAmount;

  @JsonKey(name: 'deliveryBy', defaultValue: OrderDeliveryDetailsModel.pickup)
  final OrderDeliveryDetailsModel orderDeliveryDetails;

  OrderSummaryModel(
      {required this.totalPrice,
      required this.subtotalPrice,
      required this.orderDeliveryDetails,
      required this.discountAmount,
      required this.platformFee,
      required this.deliveryFee,
      required this.couponAmount});

  factory OrderSummaryModel.fromJson(final Map<String, dynamic> data) =>
      _$OrderSummaryModelFromJson(data);
  Map<String, dynamic> toJson() => _$OrderSummaryModelToJson(this);

  factory OrderSummaryModel.empty()=>OrderSummaryModel(
    totalPrice: 0,
    subtotalPrice: 0,
    orderDeliveryDetails: OrderDeliveryDetailsModel.pickup(),
    discountAmount: 0,
    platformFee: 0,
    deliveryFee: 0,
    couponAmount: 0
  );
}
