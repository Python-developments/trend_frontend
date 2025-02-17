import 'package:json_annotation/json_annotation.dart';
import 'package:trend/core/utils/enums.dart';

import 'package:trend/core/utils/global.dart';

part 'order_status_history_model.g.dart';

@JsonSerializable()
class OrderStatusHistoryModel {
  @JsonKey(defaultValue: Global.generateDefaultValue ? OrderStatus.preparing:null)
  final OrderStatus status;

  OrderStatusHistoryModel({required this.status});
  factory OrderStatusHistoryModel.fromJson(final Map<String, dynamic> data) =>
      _$OrderStatusHistoryModelFromJson(data);
  Map<String, dynamic> toJson() => _$OrderStatusHistoryModelToJson(this);
}
