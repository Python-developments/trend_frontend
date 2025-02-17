import 'package:json_annotation/json_annotation.dart';

part 'order_card_dto.g.dart';

@JsonSerializable()
class OrderCardDto {
  final String message;
  OrderCardDto({
    required this.message,
  });

  factory OrderCardDto.fromJson(final Map<String, dynamic> data) =>
      _$OrderCardDtoFromJson(data);
  Map<String, dynamic> toJson() => _$OrderCardDtoToJson(this);
}
