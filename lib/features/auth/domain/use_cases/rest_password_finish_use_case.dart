import 'package:dartz/dartz.dart';
import 'package:trend/shared/core/failure.dart';

import '../repositories/base_auth_repositories.dart';



class RestPasswordFinishUseCase {
  final BaseAuthRepository authRepository;

  RestPasswordFinishUseCase({required this.authRepository});

  Future<Either<Failure, String>> execute({required String restToken, required String password}) async {
    return await authRepository.restPasswordFinish(restToken: restToken, password: password);
  }
}
