import 'package:trend/data/dtos/login_dto.dart';
import 'package:trend/data/dtos/register_dto.dart';
import 'package:trend/data/dtos/update_profile_dto.dart';
import 'package:trend/data/local_database/entities/user_entity.dart';
import 'package:trend/data/models/auth/login_response_model.dart';
import 'package:trend/data/models/auth/user_info_model.dart';
import 'package:trend/data/models/auth/user_profile_model.dart';
import 'package:trend/data/repositories/abstract/i_repository.dart';

abstract class IAuthRepository extends IRepository {
  IAuthRepository(super.appFlavor,super.httpClient, super.appDatabase, super.logger,);

  Future<void> register(final RegisterDto registerDto);
  Future<LoginResponseModel> loginByEmail(final LoginDto loginDto);
  Future<void> logout();
  Future<UserInfoModel> getUserProfile();

  Future<void> deleteAccount();

  Future<UserInfoModel> updateUserProfile({required final UpdateProfileDto updateProfileDto});
  Future<void> sendEmailConfirmationCode({required final String email});
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


  Future<void> setCurrentTokenSession({required final String token,required final int userId});

  Future<UserEntity?> getCachedUser();

}
