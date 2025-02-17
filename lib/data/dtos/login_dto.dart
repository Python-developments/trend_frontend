import 'package:json_annotation/json_annotation.dart';

part 'login_dto.g.dart';

@JsonSerializable()
class LoginDto {
  final String email, password;
  final String? referralCode;

  LoginDto({
    required this.email,
    required this.password,
    required this.referralCode,
  });

  Map<String, dynamic> toJson() => _$LoginDtoToJson(this);
  factory LoginDto.empty()=>LoginDto(email:'email',password:'password',referralCode: null);

}
