import 'package:dio/dio.dart';
import 'package:trend/features/auth/data/models/local/login_model_local.dart';
import 'package:trend/features/auth/data/models/local/register_model_local.dart';
import 'package:trend/features/auth/data/models/remote/login_model.dart';
import 'package:trend/features/auth/data/models/remote/register_model.dart';
import 'package:trend/features/auth/data/models/remote/verify_otp_model.dart';
import 'package:trend/shared/const/app_links.dart';
import 'package:trend/shared/core/network/server_exception.dart';

import '../../../../../shared/core/error_model/error_server_model.dart';
import '../models/local/verify_otp_local.dart';
import '../models/remote/refresh_token_model.dart';


abstract class BaseAuthDataSource {
  Future<LoginModel> login(LoginModelLocal loginModelLocal);
  Future<RegisterModel> register(RegisterModelLocal registerModelLocal);
  Future<VerifyOtpModel> verifyOtp(VerifyOtpLocal verifyOtp);
  Future<String> resendOtp(String email);
  Future<String> restPasswordSendEmail(String email);
  Future<String> restPasswordVerifyOtp({
    required String restToken,
    required String otp,
  });
  Future<String> restPasswordFinish({
    required String restToken,
    required String password,
  });
  Future<RefreshTokenModel> refreshToken(String oldToken);
}

class AuthDataSourceImpl extends BaseAuthDataSource {
  final dio = Dio()..interceptors.add(
      LogInterceptor(
        requestBody: true,
        request: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: false,
      ));

  AuthDataSourceImpl() {
    dio.options.headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
    };
  }

  @override
  Future<LoginModel> login(LoginModelLocal loginModelLocal) async {
    
    final response = await dio.post(
      ApiEndpoints.login,
      data: {
        "username": loginModelLocal.username,
        "password": loginModelLocal.password,
      },
    );
    
    if (response.statusCode == 200 || response.statusCode == 201) {
      return LoginModel.fromJson(response.data);
    }

    throw ServerException(
        errorServerModel: ErrorServerModel.fromJson(response.data));
  }

  @override
  Future<RegisterModel> register(RegisterModelLocal registerModelLocal) async {
    final response = await dio.post(
      ApiEndpoints.register,
      data: {
        "username": registerModelLocal.userName,
        "email": registerModelLocal.email,
        "full_name": registerModelLocal.fullName,
        "password": registerModelLocal.password,
        "password_confirm": registerModelLocal.confirmPassword,
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return RegisterModel.fromJson(response.data);
    }

    throw ServerException(
        errorServerModel: ErrorServerModel.fromJson(response.data));
  }

  @override
  Future<String> resendOtp(String email) async {
    final response = await dio.post(
      ApiEndpoints.resendOtp,
      data: {"email": email},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data['message'];
    }

    throw ServerException(
        errorServerModel: ErrorServerModel.fromJson(response.data));
  }

  @override
  Future<VerifyOtpModel> verifyOtp(VerifyOtpLocal verifyOtp) async {
    final response = await dio.post(
      ApiEndpoints.verifyOtp,
      data: {
        "email": verifyOtp.email,
        "otp": verifyOtp.otp,
      },
    );
    
    if (response.statusCode == 200 || response.statusCode == 201) {
      return VerifyOtpModel.fromJson(response.data);
    }

    throw ServerException(
        errorServerModel: ErrorServerModel.fromJson(response.data));
  }

  @override
  Future<String> restPasswordSendEmail(String email) async {
    final response = await dio.post(
      ApiEndpoints.resetPasswordEmailSendOtp,
      data: {"email": email},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data["reset_token"];
    }

    throw ServerException(
        errorServerModel: ErrorServerModel.fromJson(response.data));
  }

  @override
  Future<String> restPasswordVerifyOtp({
    required String restToken,
    required String otp,
  }) async {
    final response = await dio.post(
      ApiEndpoints.resetPasswordVerifyOtp,
      data: {
        "reset_token": restToken,
        "otp": otp,
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data["message"];
    }

    throw ServerException(
        errorServerModel: ErrorServerModel.fromJson(response.data));
  }

  @override
  Future<String> restPasswordFinish({
    required String restToken,
    required String password,
  }) async {
    final response = await dio.post(
      ApiEndpoints.resetPasswordFinish,
      data: {
        "reset_token": restToken,
        "new_password": password,
        "confirm_password": password,
      },
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data["message"];
    }

    throw ServerException(
        errorServerModel: ErrorServerModel.fromJson(response.data));
  }

  @override
  Future<RefreshTokenModel> refreshToken(String oldToken) async {
    final response = await dio.post(
      ApiEndpoints.refreshToken,
      data: {"refresh": oldToken},
    );

    if (response.statusCode == 200 || response.statusCode == 201) {
      return RefreshTokenModel.fromJson(response.data);
    }

    throw ServerException(
        errorServerModel: ErrorServerModel.fromJson(response.data));
  }
}
