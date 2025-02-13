import 'package:dartz/dartz.dart';
import 'package:trend/features/auth/domain/repositories/base_auth_repositories.dart';
import 'package:trend/shared/core/failure.dart';




class RestPasswordSendEmailUseCase {
  final BaseAuthRepository authRepository;
  RestPasswordSendEmailUseCase({required this.authRepository});

  Future<Either<Failure, String>> execute(String email) async {
    return await authRepository.restPasswordSendEmail(email);
  }
}
