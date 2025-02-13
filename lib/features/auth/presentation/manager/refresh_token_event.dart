import 'package:equatable/equatable.dart';



abstract class MainRefreshEvent extends Equatable {
  @override
  List<Object?> get props => [];
}


class RefreshTokenEvent extends MainRefreshEvent {
  final String oldToken;

  RefreshTokenEvent({required this.oldToken});


  @override
  List<Object?> get props => [oldToken];
}