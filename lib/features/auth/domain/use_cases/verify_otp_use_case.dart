import 'package:dartz/dartz.dart';
import 'package:trend/features/auth/data/models/local/verify_otp_local.dart';
import 'package:trend/features/auth/data/models/remote/verify_otp_model.dart';
import 'package:trend/features/auth/domain/repositories/base_auth_repositories.dart';
import 'package:trend/shared/core/failure.dart';



class VerifyOtpUseCase {
  final BaseAuthRepository authRepository;
  VerifyOtpUseCase({required this.authRepository});

  Future<Either<Failure, VerifyOtpModel>> execute(VerifyOtpLocal verifyOtpLocal) async {
    return await authRepository.verifyOtpUser(verifyOtpLocal);
  }
}
