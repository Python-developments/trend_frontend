import 'package:json_annotation/json_annotation.dart';
import 'package:trend/core/utils/enums.dart';

part 'order_delivery_details_model.g.dart';

@JsonSerializable()
class OrderDeliveryDetailsModel {
  @JsonKey(defaultValue: OrderDeliveryBy.pickUp)
  final OrderDeliveryBy deliveryBy;
  OrderDeliveryDetailsModel({required this.deliveryBy});

  factory OrderDeliveryDetailsModel.pickup() =>
      OrderDeliveryDetailsModel(deliveryBy: OrderDeliveryBy.pickUp);

  factory OrderDeliveryDetailsModel.fromJson(final Map<String, dynamic> data) =>
      _$OrderDeliveryDetailsModelFromJson(data);
  Map<String, dynamic> toJson() => _$OrderDeliveryDetailsModelToJson(this);
}
