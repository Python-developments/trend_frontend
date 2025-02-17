import 'package:injectable/injectable.dart';
import 'package:trend/data/dtos/login_dto.dart';
import 'package:trend/data/dtos/register_dto.dart';
import 'package:trend/data/dtos/update_profile_dto.dart';
import 'package:trend/data/local_database/entities/user_entity.dart';
import 'package:trend/data/models/auth/login_response_model.dart';
import 'package:trend/data/models/auth/user_profile_model.dart';
import 'package:trend/data/repositories/abstract/i_auth_repository.dart';
import 'package:trend/data/repositories/abstract/i_repository_impl.dart';

@Singleton(as: IAuthRepository)
class AuthRepository extends IAuthRepository {

  AuthRepository(super.appFlavor,super.httpClient, super.appDatabase, super.logger,);

  @override
  Future<void> register(final RegisterDto registerDto) async {
    final LoginResponseModel response = await post(
        url: 'customer/auth/signup',
        parameters: registerDto.toJson(),
        mapper: LoginResponseModel.fromJson,
        needLocation: false);

    await setCurrentTokenSession(
      token: response.token,
    );
  }

  Future<LoginResponseModel> getLoginCredentials(
          {required final String url,
          required final Map<String, dynamic> parameters}) =>
      post(
          url: url,
          parameters: parameters,
          mapper: LoginResponseModel.fromJson,
          needLocation: false);
  Future<LoginResponseModel> _login(
      {required final String url,
      required final String loginMethod,
      required final String email,
      required final Map<String, dynamic> parameters}) async {
    final LoginResponseModel response =
        await getLoginCredentials(url: url, parameters: parameters);
    await setCurrentTokenSession(
      token: response.token,
    );

    await Future.wait([
      migrateLocalUserToOnline(),
      updateNotificationsToken(),
    ]);
    return response;
  }

  @override
  Future<LoginResponseModel> loginByEmail(final LoginDto loginDto) async {
    final LoginResponseModel responseModel = await _login(
        url: 'customer/auth/login',
        parameters: loginDto.toJson(),
        email: loginDto.email,
        loginMethod: 'Email');
    return responseModel;
  }

  @override
  Future<void> sendEmailConfirmationCode({required final String email}) => post(
      url: 'customer/auth/resend-email',
      needLocation: false,
      parameters: {'email': email},
      mapper: emptyMapper);

  @override
  Future<void> resetPassword({
    required final String email,
    required final String newPassword,
    required final String otpCode,
  }) =>
      post(
          url: 'customer/auth/reset-password',
          mapper: emptyMapper,
          parameters: {
            'email': email,
            'otp': otpCode,
            'newPassword': newPassword
          },
          needLocation: false);

  @override
  Future<void> changePassword(
          {required final String oldPassword,
          required final String newPassword}) =>
      post(
          url: 'customer/auth/change-password',
          parameters: {'oldPassword': oldPassword, 'newPassword': newPassword},
          mapper: emptyMapper,
          needLocation: false);

  @override
  Future<UserProfileModel> getUserProfile() => getObject(
      url: 'customers/profile',
      mapper: UserProfileModel.fromJson,
      needLocation: false);



  @override
  Future<void> deleteNotificationsToken() => put(
      url: 'customers/ns-token',
      parameters: {
        'notificationToken': null,
        'notificationServer': notificationsModule.providerType.name
      },
      mapper: emptyMapper,
      needLocation: false);

  @override
  Future<void> logout() async {
    await Future.wait([
      notificationsModule.deleteToken(),
      appDatabase.clearUserCache(),
      deleteNotificationsToken()
    ]);

    await setCurrentTokenSession(token: '');
  }

  @override
  Future<void> checkEmailConfirmationCode(
          {required final String email, required final String otpCode}) =>
      post(
          url: 'customer/auth/verify-email',
          needLocation: false,
          parameters: {'email': email, 'otp': otpCode},
          mapper: emptyMapper);

  @override
  Future<void> sendForgetPasswordCode({required final String email}) => post(
      url: 'customer/auth/forgot-password',
      needLocation: false,
      parameters: {'email': email},
      mapper: emptyMapper);

  @override
  Future<void> deleteAccount() async {
    await Future.wait([
      notificationsModule.deleteToken(),
      appDatabase.clearUserCache(),
      deleteNotificationsToken(),
      delete(url: 'customers/profile', needLocation: false),
    ]);

    await setCurrentTokenSession(token: '');
  }

  @override
  Future<UserProfileModel> changeEmail({required final String email}) => put(
      url: 'customers/profile',
      needLocation: false,
      parameters: {'email': email},
      mapper: UserProfileModel.fromJson);

  @override
  Future<UserProfileModel> updateUserProfile(
          {required final UpdateProfileDto updateProfileDto}) =>
      put(
          url: 'customers/profile',
          needLocation: false,
          parameters: updateProfileDto.toJson(),
          mapper: UserProfileModel.fromJson);



  @override
  Future<void> setCurrentTokenSession({required final String token}) async {
    httpClient.setToken(token);
    await appDatabase.setToken(token);
  }

  @override
  Future<UserEntity?> getCachedUser() async {
    final UserEntity? user = await appDatabase.getCurrentUser();
    if (user != null) {
      httpClient.setToken(user.token);
    }
    return user;
  }

}
