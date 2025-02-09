import 'package:dartz/dartz.dart';
import 'package:trend/features/auth/data/models/local/verify_otp_local.dart';
import 'package:trend/features/auth/data/models/remote/login_model.dart';
import 'package:trend/features/auth/data/models/remote/register_model.dart';
import 'package:trend/features/auth/data/models/remote/verify_otp_model.dart';

import '../../../../shared/core/failure.dart';
import '../../data/models/local/login_model_local.dart';
import '../../data/models/local/register_model_local.dart';





abstract class BaseAuthRepository {
  Future<Either<Failure, RegisterModel>> registerUser(RegisterModelLocal registerModel);
  Future<Either<Failure, LoginModel>> loginUser(LoginModelLocal loginModel);
  Future<Either<Failure, VerifyOtpModel>> verifyOtpUser(VerifyOtpLocal verifyOtpModel);
  Future<Either<Failure, String>> resendOtp(String email);
}
