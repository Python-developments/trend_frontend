import 'package:json_annotation/json_annotation.dart';

part 'register_dto.g.dart';

@JsonSerializable()
class RegisterDto {
  final String email, password, name;
  final String? referralCode;
  RegisterDto(
      {required this.name,
      required this.email,
      required this.referralCode,
      required this.password});

  Map<String, dynamic> toJson() => _$RegisterDtoToJson(this);
}
