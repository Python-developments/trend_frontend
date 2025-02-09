// lib/features/authentication/presentation/bloc/auth_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend/features/auth/data/models/local/login_model_local.dart';
import 'package:trend/features/auth/data/models/remote/login_model.dart';
import 'package:trend/features/auth/domain/use_cases/login_use_case.dart';
import '../../domain/use_cases/register_use_case.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;

  AuthBloc({required this.loginUseCase, required this.registerUseCase}) : super(AuthInitial()) {
    
    
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());

      final result = await loginUseCase.execute(LoginModelLocal(
          username: event.username, password: event.password));

      result.fold(
        (failure) => emit(AuthError(message: failure.message)),
        (response) => emit(AuthAuthenticated(
            loginModel: LoginModel(
                refresh: response.refresh,
                access: response.access,
                userInfo: response.userInfo))),
      );
    });
  }
}




// void _onRegisterEvent(
//     RegisterEvent event, Emitter<AuthState> emit) async {
//   emit(AuthLoading());
//   final Either<Failure, Map<String, dynamic>> result =
//       await registerUser(RegisterParams(
//     username: event.username,
//     email: event.email,
//     mobile: event.mobile,
//     fullName: event.fullName,
//     password: event.password,
//     passwordConfirm: event.passwordConfirm,
//   ));
//   result.fold(
//     (failure) => emit(AuthError(message: failure.message)),
//     (response) =>
//         emit(AuthRegistered(message: response['message'])),
//   );
// }