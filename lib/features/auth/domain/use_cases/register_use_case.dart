import 'package:dartz/dartz.dart';
import 'package:trend/features/auth/data/models/local/register_model_local.dart';
import 'package:trend/features/auth/data/models/remote/register_model.dart';
import 'package:trend/features/auth/domain/repositories/base_auth_repositories.dart';
import 'package:trend/shared/core/failure.dart';




class RegisterUseCase {
  final BaseAuthRepository authRepository;
  RegisterUseCase({required this.authRepository});

  Future<Either<Failure, RegisterModel>> execute(RegisterModelLocal registerModelLocal) async {
    return await authRepository.registerUser(registerModelLocal);
  }
}
