import 'package:trend/data/dtos/login_dto.dart';
import 'package:trend/data/dtos/register_dto.dart';
import 'package:trend/data/dtos/update_profile_dto.dart';
import 'package:trend/data/local_database/entities/user_entity.dart';
import 'package:trend/data/models/address_model.dart';
import 'package:trend/data/models/auth/login_response_model.dart';
import 'package:trend/data/models/auth/user_profile_model.dart';
import 'package:trend/data/repositories/abstract/i_repository_impl.dart';

abstract class IAuthRepository extends IRepositoryImpl {
  IAuthRepository(super.currentLocationController,super.appFlavor,super.httpClient, super.appDatabase, super.logger,);

  Future<void> register(final RegisterDto registerDto);
  Future<LoginResponseModel> loginByEmail(final LoginDto loginDto);
  Future<LoginResponseModel> loginUsingGmail(
      {required final String? referralCode});
  Future<LoginResponseModel> loginUsingFacebook(
      {required final String? referralCode});
  Future<LoginResponseModel> loginUsingApple(
      {required final String? referralCode});
  Future<void> logout();
  Future<UserProfileModel> getUserProfile();

  Future<void> deleteAccount();

  Future<UserProfileModel> updateUserProfile(
      {required final UpdateProfileDto updateProfileDto});

  Future<void> sendPhoneNumberConfirmationCode(
      {required final String phoneNumber});
  Future<void> sendEmailConfirmationCode({required final String email});
  Future<void> checkPhoneNumberConfirmationCode(
      {required final String phoneNumber, required final String otpCode});
  Future<void> checkEmailConfirmationCode(
      {required final String email, required final String otpCode});
  Future<UserProfileModel> changeEmail({required final String email});
  Future<void> resetPassword({
    required final String email,
    required final String otpCode,
    required final String newPassword,
  });
  Future<void> changePassword({
    required final String oldPassword,
    required final String newPassword,
  });
  Future<void> sendForgetPasswordCode({required final String email});

  Future<void> updateNotificationsToken();
  Future<void> deleteNotificationsToken();

  Future<void> setCurrentTokenSession({required final String token});

  Future<UserEntity?> getCachedUser();
  Future<void> setLastLocation({
    required final double latitude,
    required final double longitude,
    required final String? addressString,
    required final AddressModel? address,
  });
}
