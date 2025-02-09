import 'package:trend/features/auth/domain/entities/verify_otp.dart';

class VerifyOtpModel extends VerifyOtp {
  VerifyOtpModel({required super.message, required super.user});

factory VerifyOtpModel.fromJson(Map<String, dynamic> json){
  return VerifyOtpModel(
    message: json["message"],
    user: json["user"] == null ? null : UserModel.fromJson(json["user"]),
  );
}
}


class  UserModel extends User {
  UserModel({required super.email, required super.isEmailVerified});

factory UserModel.fromJson(Map<String, dynamic> json){
  return UserModel(
    email: json["email"],
    isEmailVerified: json["is_email_verified"],
  );
}
  
}