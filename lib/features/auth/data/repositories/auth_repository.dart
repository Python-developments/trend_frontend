import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:trend/features/auth/data/data_sources/auth_data_source.dart';
import 'package:trend/features/auth/data/models/local/login_model_local.dart';
import 'package:trend/features/auth/data/models/local/register_model_local.dart';
import 'package:trend/features/auth/data/models/local/verify_otp_local.dart';
import 'package:trend/features/auth/data/models/remote/login_model.dart';
import 'package:trend/features/auth/data/models/remote/register_model.dart';
import 'package:trend/features/auth/data/models/remote/verify_otp_model.dart';
import 'package:trend/features/auth/domain/entities/resfresh_token.dart';
import 'package:trend/features/auth/domain/repositories/base_auth_repositories.dart';

import '../../../../../shared/core/failure.dart';
import '../../../../../shared/core/network/server_exception.dart';

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
      return Left(ServerFailure(failure.errorServerModel.statusMessage));
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
      return Left(ServerFailure(failure.errorServerModel.statusMessage));
    } on DioException catch (e) {
      print(e.response?.data); // Debug: Log full response to inspect errors

      final errorData = e.response?.data;

      // Extract errors from the response
      final errors = errorData?['errors'];

      // Build error message based on available fields
      String errorMessage = '';

      if (errors != null) {
        if (errors.containsKey('username')) {
          errorMessage += errors['username'][0];
        } else if (errors.containsKey('email')) {
          errorMessage += errors['email'][0];
        } else if (errors.containsKey('password')) {
          errorMessage += errors['password'][0];
        } else if (errors.containsKey('phone')) {
          errorMessage += errors['phone'][0];
        }
      }

      // Fallback if no detailed error is found
      if (errorMessage.isEmpty) {
        errorMessage = errorData?['message'] ??
            "Something went wrong, please try again later.";
      }

      return Left(ServerFailure(errorMessage));
    }
  }

  @override
  Future<Either<Failure, String>> resendOtp(String email) async {
    try {
      final result = await baseAuthDataSource.resendOtp(email);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorServerModel.statusMessage));
    } on DioException catch (e) {
      final errorDetail = e.response?.data['detail'] ??
          e.response?.data['message'] ??
          "Something went wrong, please try again later";
      return Left(ServerFailure(errorDetail));
    }
  }

  @override
  Future<Either<Failure, VerifyOtpModel>> verifyOtpUser(
      VerifyOtpLocal verifyOtpModel) async {
    try {
      final result = await baseAuthDataSource.verifyOtp(verifyOtpModel);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorServerModel.statusMessage));
    } on DioException catch (e) {
      final errorDetail = e.response?.data['error'] ??
          e.response?.data['message'] ??
          "Something went wrong, please try again later";
      return Left(ServerFailure(errorDetail));
    }
  }

  @override
  Future<Either<Failure, String>> restPasswordSendEmail(String email) async {
    try {
      final result = await baseAuthDataSource.restPasswordSendEmail(email);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorServerModel.statusMessage));
    } on DioException catch (e) {
      final errorDetail = e.response?.data['email'][0] ??
          e.response?.data['message'] ??
          "Too many OTP resend attempts. Please try again later.";
      return Left(ServerFailure(errorDetail));
    }
  }

  @override
  Future<Either<Failure, String>> restPasswordVerifyOtp(
      {required String restToken, required String otp}) async {
    try {
      final result = await baseAuthDataSource.restPasswordVerifyOtp(
          restToken: restToken, otp: otp);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorServerModel.statusMessage));
    } on DioException catch (e) {
      final errorDetail =
          e.response?.data['error'] ?? "Please try again later.";
      return Left(ServerFailure(errorDetail));
    }
  }

  @override
  Future<Either<Failure, String>> restPasswordFinish(
      {required String restToken, required String password}) async {
    try {
      final result = await baseAuthDataSource.restPasswordFinish(
          restToken: restToken, password: password);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorServerModel.statusMessage));
    } on DioException catch (e) {
      final errorDetail = e.response?.data['new_password'][0] ??
          e.response?.data['otp'][0] ??
          e.response?.data['message'] ??
          "Ensure Password or Confirm Password has at least 8 characters.";
      return Left(ServerFailure(errorDetail));
    }
  }

  @override
  Future<Either<Failure, RefreshToken>> refreshToken(String oldToken) async {
    print(
        "------------------------------------------$oldToken---------------------------");
    try {
      final result = await baseAuthDataSource.refreshToken(oldToken);
      return Right(result);
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorServerModel.statusMessage));
    } on DioException catch (e) {
      print(
          "-#####################################${e.response?.data}"); // Debug: Log full response to inspect errors
      final errorDetail = e.response?.data['code'] ??
          e.response?.data['refresh'][0] ??
          "Token has wrong type";
      return Left(ServerFailure(errorDetail));
    }
  }
}
