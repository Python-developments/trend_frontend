import 'package:equatable/equatable.dart';



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
  final String username;
  final String email;
  final String mobile;
  final String fullName;
  final String password;
  final String passwordConfirm;

  RegisterEvent({
    required this.username,
    required this.email,
    required this.mobile,
    required this.fullName,
    required this.password,
    required this.passwordConfirm,
  });

  @override
  List<Object?> get props => [username, email, mobile, fullName, password, passwordConfirm];
}