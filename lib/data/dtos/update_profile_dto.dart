import 'package:json_annotation/json_annotation.dart';
import 'package:trend/core/utils/enums.dart';

part 'update_profile_dto.g.dart';

@JsonSerializable()
class UpdateProfileDto {
  final String? name, phoneNumber;

  @JsonKey(name: 'DOB')
  final DateTime? birthday;

  @JsonKey(name: 'gender')
  final GenderType? genderType;
  UpdateProfileDto(
      {this.name, this.birthday, this.genderType, this.phoneNumber});

  Map<String, dynamic> toJson() => _$UpdateProfileDtoToJson(this);
}
