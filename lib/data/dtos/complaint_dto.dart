import 'package:json_annotation/json_annotation.dart';

part 'complaint_dto.g.dart';

@JsonSerializable()
class ComplaintDto {
  @JsonKey(name: 'tag')
  final String reasonId;
  @JsonKey(name: 'text')
  final String? notes;
  @JsonKey(name: 'image')
  final String? imageId;

  ComplaintDto(
      {required this.reasonId, required this.notes, required this.imageId});
  Map<String, dynamic> toJson() => _$ComplaintDtoToJson(this);
}
