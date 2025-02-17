import 'package:json_annotation/json_annotation.dart';

part 'creating_order_response_model.g.dart';

@JsonSerializable()
class CreatingOrderResponseModel {
  final String orderId;

  @JsonKey(name: 'checkoutPage')
  final String? checkoutPageLink;

  CreatingOrderResponseModel(
      {required this.orderId, required this.checkoutPageLink});

  factory CreatingOrderResponseModel.fromJson(
          final Map<String, dynamic> data) =>
      _$CreatingOrderResponseModelFromJson(data);
}
