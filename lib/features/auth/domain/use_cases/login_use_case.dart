import 'package:dartz/dartz.dart';
import 'package:trend/features/auth/data/models/remote/login_model.dart';
import 'package:trend/features/auth/domain/repositories/base_auth_repositories.dart';
import 'package:trend/shared/core/failure.dart';

import '../../data/models/local/login_model_local.dart';

class LoginUseCase {
  final BaseAuthRepository authRepository;
  LoginUseCase({required this.authRepository});

  Future<Either<Failure, LoginModel>> execute(LoginModelLocal loginModelLocal) async {
    return await authRepository.loginUser(loginModelLocal);
  }
}
