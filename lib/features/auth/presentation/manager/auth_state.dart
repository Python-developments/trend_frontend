import 'package:equatable/equatable.dart';
import 'package:trend/features/auth/data/models/local/verify_otp_local.dart';
import 'package:trend/features/auth/data/models/remote/login_model.dart';
import 'package:trend/features/auth/data/models/remote/register_model.dart';
import 'package:trend/features/auth/data/models/remote/verify_otp_model.dart';



abstract class AuthState extends Equatable {
  @override
  List<Object?> get props => [];
}

class AuthInitial extends AuthState {}


class AuthLoading extends AuthState {}
class AuthAuthenticated extends AuthState {
  final LoginModel loginModel;

  AuthAuthenticated({required this.loginModel});

  @override
  List<Object?> get props => [loginModel];
}
class AuthRegistered extends AuthState {
  final RegisterModel registerModel;

  AuthRegistered({required this.registerModel});

  @override
  List<Object?> get props => [registerModel];
}

class AuthOptConfirmed extends AuthState {
  final VerifyOtpModel verifyOtp;

  AuthOptConfirmed({required this.verifyOtp});
  @override
  List<Object?> get props => [verifyOtp];
  
}

class AuthOptSent extends AuthState {
  final String message;
  AuthOptSent({required this.message});

  @override
  List<Object?> get props => [message];
}


class AuthError extends AuthState {
  final String message;

  AuthError({required this.message});

  @override
  List<Object?> get props => [message];
}