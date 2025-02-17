import 'package:freezed_annotation/freezed_annotation.dart';

part 'rate_order_dto.g.dart';

@JsonSerializable()
class RateOrderDto {
  final String orderId;
  final int orderRating, deliveryRating;

  @JsonKey(name: 'commentOnVendor')
  final String? vendorNote;
  @JsonKey(name: 'commentOnDelivery')
  final String? deliveryNote;
  RateOrderDto(
      {required this.orderId,
      required this.orderRating,
      required this.deliveryRating,
      required this.vendorNote,
      required this.deliveryNote});

  Map<String, dynamic> toJson() => _$RateOrderDtoToJson(this);
}
