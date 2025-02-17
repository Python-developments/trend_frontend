import 'package:json_annotation/json_annotation.dart';
import 'package:trend/core/utils/global.dart';

part 'payment_card_details_model.g.dart';

@JsonSerializable()
class PaymentCardDetailsModel {
  @JsonKey(name: 'last4',defaultValue: Global.generateDefaultValue ? '0000':null)
  final String lastFourDigits;
  @JsonKey(name: 'brand',defaultValue: Global.generateDefaultValue ? '':null)
  final String cardType;
  PaymentCardDetailsModel(
      {required this.lastFourDigits, required this.cardType});

  factory PaymentCardDetailsModel.fromJson(final Map<String, dynamic> data) =>
      _$PaymentCardDetailsModelFromJson(data);
  Map<String, dynamic> toJson() => _$PaymentCardDetailsModelToJson(this);
}
