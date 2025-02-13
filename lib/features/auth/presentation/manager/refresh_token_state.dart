

import 'package:equatable/equatable.dart';

import '../../data/models/remote/refresh_token_model.dart';


abstract class RefreshTokenState extends Equatable {
  @override
  List<Object?> get props => [];
}

class RefreshTokenInitial extends RefreshTokenState {}
class RefreshTokenLoading extends RefreshTokenState {}


class RefreshTokenSuccess extends RefreshTokenState {
  final RefreshTokenModel refreshTokenModel;

  RefreshTokenSuccess({required this.refreshTokenModel});

  @override
  List<Object?> get props => [refreshTokenModel];
}

class RefreshTokenError extends RefreshTokenState {
  final String message;

  RefreshTokenError({required this.message});

  @override
  List<Object?> get props => [message];
}