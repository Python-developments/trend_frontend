import 'package:json_annotation/json_annotation.dart';
import 'package:trend/core/utils/enums.dart';

part 'support_request_dto.g.dart';

@JsonSerializable()
class SupportRequestDto {
  final String name, email, phoneNumber;

  @JsonKey(name: 'content')
  final String message;

  @JsonKey(
    name: 'subject',
  )
  final SupportRequestType supportRequestType;

  SupportRequestDto(
      {required this.name,
      required this.email,
      required this.phoneNumber,
      required this.message,
      required this.supportRequestType});

  Map<String, dynamic> toJson() => _$SupportRequestDtoToJson(this);
}
