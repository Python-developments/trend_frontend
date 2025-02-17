import 'package:json_annotation/json_annotation.dart';

part 'order_cancelling_dto.g.dart';

@JsonSerializable()
class OrderCancellingDto {
  @JsonKey(name: 'tag')
  final String reasonId;
  @JsonKey(name: 'comment')
  final String? notes;

  OrderCancellingDto({
    required this.reasonId,
    required this.notes,
  });
  Map<String, dynamic> toJson() => _$OrderCancellingDtoToJson(this);
}
