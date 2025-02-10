import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend/features/auth/data/models/local/login_model_local.dart';
import 'package:trend/features/auth/data/models/remote/login_model.dart';
import 'package:trend/features/auth/data/models/remote/register_model.dart';
import 'package:trend/features/auth/data/models/remote/verify_otp_model.dart';
import 'package:trend/features/auth/domain/use_cases/login_use_case.dart';
import 'package:trend/features/auth/domain/use_cases/register_use_case.dart';
import 'package:trend/features/auth/domain/use_cases/resend_otp_use_case.dart';
import 'package:trend/features/auth/domain/use_cases/verify_otp_use_case.dart';

import '../../../../shared/core/local/SharedPreferencesDemo.dart';
import '../../../../shared/core/shared_preferences.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final VerifyOtpUseCase otpConfirmUseCase;
  final ResendOtpUseCase resendOtpUseCase;

  final SharedPreferencesDemo sharedPreferencesDemo = SharedPreferencesDemo();

  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.otpConfirmUseCase,
    required this.resendOtpUseCase,
  }) : super(AuthInitial()) {
    on<LoginEvent>((event, emit) async {
      emit(AuthLoading());

      final result = await loginUseCase.execute(LoginModelLocal(
        username: event.username,
        password: event.password,
      ));

      await result.fold(
        (failure) async => emit(AuthError(message: failure.message)),
        (response) async {
          await token.setToken(response.access ?? "");
          final user = response.userInfo;
          print(user!.avatar);
          print(
              "=====================================++++++++++++++++++++++++++++++++++++++++++++++");
          await sharedPreferencesDemo.saveUserData(
            Profileid: "${user.profile!.id}",
            id: "${user.id}",
            email: "${user.email}",
            username: "${user.username}",
            fullName: "${user.fullName}",
            avatar: "${user.avatar}",
            bio: "${user.profile!.bio}",
            mobile: "",
            followers: "${user.followers}",
            following: "${user.following}",
            verified: user.profile!.verified ?? false,
            totalPosts: "${user.totalPosts}",
            totalLikes: "${user.totalLikes}",
            is_private: user.profile!.isPrivate ?? false,
          );

          if (!emit.isDone) {
            emit(AuthAuthenticated(
              loginModel: LoginModel(
                refresh: response.refresh,
                access: response.access,
                userInfo: response.userInfo,
              ),
            ));
          }
        },
      );
    });

    on<RegisterEvent>((event, emit) async {
      emit(AuthLoading());

      final result = await registerUseCase.execute(event.registerModel);

      result.fold(
        (failure) => emit(AuthError(message: failure.message)),
        (response) {
          emit(AuthRegistered(
            registerModel: RegisterModel(
              status: response.status,
              message: response.message,
              data: response.data,
            ),
          ));
        },
      );
    });

    on<OptConfirmEvent>((event, emit) async {
      emit(AuthLoading());

      final result = await otpConfirmUseCase.execute(event.verifyOtpModel);

      result.fold(
        (failure) => emit(AuthError(message: failure.message)),
        (response) => emit(AuthOptConfirmed(
          verifyOtp: VerifyOtpModel(
            message: response.message,
            user: response.user,
          ),
        )),
      );
    });

    on<OptResendEvent>((event, emit) async {
      emit(AuthLoading());

      final result = await resendOtpUseCase.execute(event.email);

      result.fold(
        (failure) => emit(AuthError(message: failure.message)),
        (response) => emit(AuthOptSent(message: response.toString())),
      );
    });
  }
}
