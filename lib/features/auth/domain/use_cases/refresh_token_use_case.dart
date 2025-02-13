import 'package:dartz/dartz.dart';
import 'package:trend/features/auth/domain/repositories/base_auth_repositories.dart';
import 'package:trend/shared/core/failure.dart';
import '../entities/resfresh_token.dart';




class RefreshTokenUseCase {
  final BaseAuthRepository authRepository;
  RefreshTokenUseCase({required this.authRepository});

  Future<Either<Failure, RefreshToken>> execute(String oldToken)async{
    return  await authRepository.refreshToken(oldToken);
  }
}
