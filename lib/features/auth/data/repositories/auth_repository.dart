import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:trend/features/auth/data/data_sources/auth_data_source.dart';
import 'package:trend/features/auth/data/models/local/login_model_local.dart';
import 'package:trend/features/auth/data/models/local/register_model_local.dart';
import 'package:trend/features/auth/data/models/local/verify_otp_local.dart';
import 'package:trend/features/auth/data/models/remote/login_model.dart';
import 'package:trend/features/auth/data/models/remote/register_model.dart';
import 'package:trend/features/auth/data/models/remote/verify_otp_model.dart';
import 'package:trend/features/auth/domain/repositories/base_auth_repositories.dart';
import '../../../../shared/core/failure.dart';
import '../../../../shared/core/network/server_exception.dart';

class AuthRepository extends BaseAuthRepository {
  final BaseAuthDataSource baseAuthDataSource;

  AuthRepository({required this.baseAuthDataSource});

  @override
  Future<Either<Failure, LoginModel>> loginUser(
      LoginModelLocal loginModel) async {
    try {
      final result = await baseAuthDataSource.login(loginModel);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(failure.errorServerModel.statusMessage));
    } on DioException catch (e) {
      final errorDetail = e.response?.data['detail'] ??
          e.response?.data['error'] ??
          "Something went wrong, please try again later";
      return Left(ServerFailure(errorDetail));
    }
  }

  @override
  Future<Either<Failure, RegisterModel>> registerUser(
      RegisterModelLocal registerModel) async {
    try {
      final result = await baseAuthDataSource.register(registerModel);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(failure.errorServerModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, String>> resendOtp(String email) async {
    try {
      final result = await baseAuthDataSource.resendOtp(email);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(failure.errorServerModel.statusMessage));
    }
  }

  @override
  Future<Either<Failure, VerifyOtpModel>> verifyOtpUser(
      VerifyOtpLocal verifyOtpModel) async {
    try {
      final result =
          await baseAuthDataSource.verifyOtp(verifyOtpModel);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(
          ServerFailure(failure.errorServerModel.statusMessage));
    }
  }
}
