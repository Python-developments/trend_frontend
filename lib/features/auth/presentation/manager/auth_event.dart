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
  List<Object?> get props => [registerModel];}

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


