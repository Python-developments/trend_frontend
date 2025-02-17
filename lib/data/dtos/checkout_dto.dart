import 'package:json_annotation/json_annotation.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/dtos/address_dto.dart';
import 'package:trend/data/dtos/order_card_dto.dart';

import 'package:trend/data/dtos/payment_details_dto.dart';

part 'checkout_dto.g.dart';

@JsonSerializable()
class CheckoutDto {
  final String cartId;
  final OrderType orderType;
  final String? couponCode;
  final String? recipientName;
  @JsonKey(name: 'recipientPhone')
  final String? recipientPhoneNumber;
  final PaymentDetailsDto paymentDetails;
  @JsonKey(name: 'card')
  final OrderCardDto? orderCard;
  final AddressDto address;
  final DateTime? schedulingDate;

  CheckoutDto(
      {required this.cartId,
      required this.orderType,
      required this.couponCode,
      required this.orderCard,
      required this.recipientName,
      required this.recipientPhoneNumber,
      required this.address,
      required this.schedulingDate,
      required this.paymentDetails});

  Map<String, dynamic> toJson() => _$CheckoutDtoToJson(this);
}
