import 'package:json_annotation/json_annotation.dart';

part 'update_profile_dto.g.dart';

@JsonSerializable()
class UpdateProfileDto {
  UpdateProfileDto();

  Map<String, dynamic> toJson() => _$UpdateProfileDtoToJson(this);
}
