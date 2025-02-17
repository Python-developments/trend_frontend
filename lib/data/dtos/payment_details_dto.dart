import 'package:json_annotation/json_annotation.dart';

part 'payment_details_dto.g.dart';

@JsonSerializable()
class PaymentDetailsDto {
  @JsonKey(name: 'paymentMethod')
  final String type;
  final String? paymentMethodId;

  PaymentDetailsDto({
    required this.type,
    required this.paymentMethodId,
  });

  factory PaymentDetailsDto.fromJson(final Map<String, dynamic> data) =>
      _$PaymentDetailsDtoFromJson(data);
  Map<String, dynamic> toJson() => _$PaymentDetailsDtoToJson(this);
}
