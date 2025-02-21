import 'package:json_annotation/json_annotation.dart';

part 'register_dto.g.dart';

@JsonSerializable()
class RegisterDto {
  final String username, password, email;

  @JsonKey(name: 'password_confirm')
  final String confirmPassword;


  RegisterDto(
      {required this.username,
      required this.email,
      required this.confirmPassword,
      required this.password});

  Map<String, dynamic> toJson() => _$RegisterDtoToJson(this);
}
