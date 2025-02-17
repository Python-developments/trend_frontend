import 'package:json_annotation/json_annotation.dart';

import 'package:trend/data/models/orders/payment_card_details_model.dart';

part 'payment_card_model.g.dart';

@JsonSerializable()
class PaymentCardModel {
  final String id;
  @JsonKey(name: 'card')
  final PaymentCardDetailsModel cardDetails;
  PaymentCardModel({required this.id, required this.cardDetails});

  factory PaymentCardModel.fromJson(final Map<String, dynamic> data) =>
      _$PaymentCardModelFromJson(data);
}
