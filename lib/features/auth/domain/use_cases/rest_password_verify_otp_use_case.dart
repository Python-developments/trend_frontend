import 'package:dartz/dartz.dart';
import 'package:trend/features/auth/domain/repositories/base_auth_repositories.dart';
import 'package:trend/shared/core/failure.dart';




class RestPasswordVerifyOtpUseCase {
  final BaseAuthRepository authRepository;
  RestPasswordVerifyOtpUseCase({required this.authRepository});

  Future<Either<Failure, String>> execute({required String restToken, required String otp}) async {
    return await authRepository.restPasswordVerifyOtp(restToken: restToken, otp: otp);
  }
}
