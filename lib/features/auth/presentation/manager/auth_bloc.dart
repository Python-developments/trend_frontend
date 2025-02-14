import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend/features/auth/data/models/local/login_model_local.dart';
import 'package:trend/features/auth/data/models/remote/login_model.dart';
import 'package:trend/features/auth/data/models/remote/register_model.dart';
import 'package:trend/features/auth/data/models/remote/verify_otp_model.dart';
import 'package:trend/features/auth/domain/use_cases/login_use_case.dart';
import 'package:trend/features/auth/domain/use_cases/register_use_case.dart';
import 'package:trend/features/auth/domain/use_cases/resend_otp_use_case.dart';
import 'package:trend/features/auth/domain/use_cases/verify_otp_use_case.dart';

import '../../../../../shared/core/local/SharedPreferencesDemo.dart';
import '../../../../../shared/utiles/securely _save.dart';
import '../../domain/use_cases/rest_password_Send_email_use_case.dart';
import '../../domain/use_cases/rest_password_finish_use_case.dart';
import '../../domain/use_cases/rest_password_verify_otp_use_case.dart';
import 'auth_event.dart';
import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final LoginUseCase loginUseCase;
  final RegisterUseCase registerUseCase;
  final VerifyOtpUseCase otpConfirmUseCase;
  final ResendOtpUseCase resendOtpUseCase;

  final RestPasswordSendEmailUseCase restPasswordEmailValidationUseCase;
  final RestPasswordVerifyOtpUseCase restPasswordVerifyOtpUseCase;
  final RestPasswordFinishUseCase restPasswordFinishUseCase;

  final SharedPreferencesDemo sharedPreferencesDemo = SharedPreferencesDemo();

  AuthBloc({
    required this.loginUseCase,
    required this.registerUseCase,
    required this.otpConfirmUseCase,
    required this.resendOtpUseCase,
    required this.restPasswordEmailValidationUseCase,
    required this.restPasswordVerifyOtpUseCase,
    required this.restPasswordFinishUseCase,
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
          // await token.setToken(response.access ?? "");

          await saveRefreshToken(response.refresh ?? "");
          await saveAccessToken(response.access ?? "");

          final user = response.userInfo;

          await sharedPreferencesDemo.saveUserData(
            id: "${user?.id}",
            email: "${user?.email}",
            username: "${user?.username}",
            fullName: "${user?.fullName}",
            avatar: "${user?.avatar}",
            bio: "",
            mobile: "",
            followers: "${user?.followers}",
            following: "${user?.following}",
            totalPosts: "${user?.totalPosts}",
            totalLikes: "${user?.totalLikes}",
            is_private: false,
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

    on<RestPasswordSendEmailEvent>((event, emit) async {
      emit(AuthLoading());

      final result =
          await restPasswordEmailValidationUseCase.execute(event.email);

      result.fold(
        (failure) => emit(AuthError(message: failure.message)),
        (response) => emit(RestPasswordSendEmail(message: response.toString())),
      );
    });
    on<RestPasswordVerifyOtpEvent>((event, emit) async {
      emit(AuthLoading());

      final result = await restPasswordVerifyOtpUseCase.execute(
          restToken: event.restToken, otp: event.otp);

      result.fold(
        (failure) => emit(AuthError(message: failure.message)),
        (response) => emit(RestPasswordVerifyOtp(message: response.toString())),
      );
    });
    on<RestPasswordFinishEvent>((event, emit) async {
      emit(AuthLoading());

      final result = await restPasswordFinishUseCase.execute(
          restToken: event.restToken, password: event.password);

      result.fold(
        (failure) => emit(AuthError(message: failure.message)),
        (response) => emit(RestPasswordFinish(message: response.toString())),
      );
    });
  }
}
