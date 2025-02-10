import 'package:dio/dio.dart';
import 'package:trend/features/auth/data/models/local/login_model_local.dart';
import 'package:trend/features/auth/data/models/local/register_model_local.dart';
import 'package:trend/features/auth/data/models/remote/login_model.dart';
import 'package:trend/features/auth/data/models/remote/register_model.dart';
import 'package:trend/features/auth/data/models/remote/verify_otp_model.dart';
import 'package:trend/shared/const/app_links.dart';
import 'package:trend/shared/core/network/server_exception.dart';

import '../../../../shared/core/error_model/error_server_model.dart';
import '../../../../shared/core/shared_preferences.dart';
import '../models/local/verify_otp_local.dart';

abstract class BaseAuthDataSource {
  Future<LoginModel> login(LoginModelLocal loginModelLocal);
  Future<RegisterModel> register(RegisterModelLocal registerModelLocal);
  Future<VerifyOtpModel> verifyOtp(VerifyOtpLocal VerifyOtp);
  Future<String> resendOtp(String email);
}

class AuthDataSourceImpl extends BaseAuthDataSource {
  
  final userToken = token.getToken();
  @override
  Future<LoginModel> login(LoginModelLocal loginModelLocal) async {
    
    final response = await Dio().post(
      ApiEndpoints.login,
      data: {
        "username": loginModelLocal.username,
        "password": loginModelLocal.password,
      },
      options: Options(
        headers: {
          "Authorization": userToken ??
          "Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoiYWNjZXNzIiwiZXhwIjoxNzcwNjM0NTg0LCJpYXQiOjE3MzkwOTg1ODQsImp0aSI6ImJjNmZkOWRjZjM5ODQ4MTA4Mjg1ZWEzMTUyZmNhNDg4IiwidXNlcl9pZCI6OTB9.XCm2NgLO51wGk_iiWsemmfQl58eK-fR5KQHTsYxlseg",
        },
      ),
    );
    
    if (response.statusCode == 200 || response.statusCode == 201) {
      return LoginModel.fromJson(response.data);
    } else {
      throw ServerException(
          errorServerModel: ErrorServerModel.fromJson(response.data));
    }
    
  }

  @override
  Future<RegisterModel> register(
      RegisterModelLocal registerModelLocal) async {
    final response = await Dio().post(
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
    } else {
      throw ServerException(
          errorServerModel: ErrorServerModel.fromJson(response.data));
    }
  }

  @override
  Future<String> resendOtp(String email) async {
    final response = await Dio().post(
      ApiEndpoints.resendOtp,
      data: {
        "email": email,
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data['message'];
    }
    throw ServerException(
        errorServerModel: ErrorServerModel.fromJson(response.data));
  }

  @override
  Future<VerifyOtpModel> verifyOtp(VerifyOtpLocal VerifyOtp) async {
    final response = await Dio().post(
      ApiEndpoints.resendOtp,
      data: {
        "email": VerifyOtp.email,
        "otp": VerifyOtp.otp,
      },
    );
    if (response.statusCode == 200 || response.statusCode == 201) {
      return response.data;
    }
    throw ServerException(
        errorServerModel: ErrorServerModel.fromJson(response.data));
  }
}
