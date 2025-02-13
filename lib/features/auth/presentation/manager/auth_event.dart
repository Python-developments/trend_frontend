import 'package:equatable/equatable.dart';
import 'package:trend/features/auth/data/models/local/register_model_local.dart';
import 'package:trend/features/auth/data/models/local/verify_otp_local.dart';

abstract class AuthEvent extends Equatable {
  @override
  List<Object?> get props => [];
}

class LoginEvent extends AuthEvent {
  final String username;
  final String password;

  LoginEvent({required this.username, required this.password});

  @override
  List<Object?> get props => [username, password];
}
class RegisterEvent extends AuthEvent {
  final RegisterModelLocal registerModel;

  RegisterEvent({required this.registerModel});

  @override
  List<Object?> get props => [registerModel];
}
class OptConfirmEvent extends AuthEvent {
  final VerifyOtpLocal verifyOtpModel;

  OptConfirmEvent({required this.verifyOtpModel});

  @override
  List<Object?> get props => [verifyOtpModel];
}
class OptResendEvent extends AuthEvent {
  final String email;

  OptResendEvent({required this.email});

  @override
  List<Object?> get props => [email];
}


class RestPasswordSendEmailEvent extends AuthEvent {
  final String email;

  RestPasswordSendEmailEvent({required this.email});

  @override
  List<Object?> get props => [email];
}
class RestPasswordVerifyOtpEvent extends AuthEvent {
  final String restToken;
  final String otp;

  RestPasswordVerifyOtpEvent({required this.restToken, required this.otp});
  @override
  List<Object?> get props => [restToken, otp];
}
class RestPasswordFinishEvent extends AuthEvent {
  final String restToken;
  final String password;
  RestPasswordFinishEvent({required this.restToken, required this.password});

  @override
  List<Object?> get props => [restToken, password];
}
