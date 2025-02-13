import 'package:bloc/bloc.dart';
import 'package:trend/features/auth/presentation/manager/refresh_token_event.dart';
import 'package:trend/features/auth/presentation/manager/refresh_token_state.dart';

import '../../data/models/remote/refresh_token_model.dart';
import '../../domain/use_cases/refresh_token_use_case.dart';

class RefreshTokenBloc extends Bloc<RefreshTokenEvent, RefreshTokenState> {
  final RefreshTokenUseCase refreshTokenUseCase;

  RefreshTokenBloc({required this.refreshTokenUseCase})
      : super(RefreshTokenInitial()) {
    on<RefreshTokenEvent>((event, emit) async {
      emit(RefreshTokenLoading());

      final result =
          await refreshTokenUseCase.execute(event.oldToken);

      result.fold(
        (failure) =>
            emit(RefreshTokenError(message: failure.message)),
        (response) => emit(RefreshTokenSuccess(
            refreshTokenModel: RefreshTokenModel(
                access: response.access, refresh: response.refresh))),
      );
    });
  }
}
