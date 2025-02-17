import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';
import 'package:trend/data/dtos/login_dto.dart';
import 'package:trend/data/dtos/register_dto.dart';
import 'package:trend/data/dtos/update_profile_dto.dart';
import 'package:trend/data/local_database/entities/user_entity.dart';
import 'package:trend/data/models/address_model.dart';
import 'package:trend/data/models/auth/apple_sign_in_response_model.dart';
import 'package:trend/data/models/auth/facebook_sign_in_response_model.dart';
import 'package:trend/data/models/auth/google_sign_in_response_model.dart';
import 'package:trend/data/models/auth/login_response_model.dart';
import 'package:trend/data/models/auth/user_profile_model.dart';
import 'package:trend/data/repositories/abstract/i_auth_repository.dart';
import 'package:trend/data/repositories/abstract/i_cart_repository.dart';
import 'package:trend/data/repositories/abstract/i_products_repository.dart';
import 'package:trend/data/repositories/abstract/i_repository_impl.dart';
import 'package:trend/data/repositories/abstract/i_vendors_repository.dart';
import 'package:trend/third_parties_modules/abstract/i_notifications_module.dart';
import 'package:trend/third_parties_modules/abstract/i_social_media_module.dart';

@Singleton(as: IAuthRepository)
class AuthRepository extends IAuthRepository {
  final ISocialMediaModule socialMediaModule;
  final INotificationsModule notificationsModule;
  final IProductsRepository productsRepository;
  final IVendorsRepository vendorsRepository;
  final ICartRepository cartRepository;

  AuthRepository(
      this.socialMediaModule,
      this.notificationsModule,
      this.productsRepository,
      this.vendorsRepository,
      this.cartRepository,super.currentLocationController,
      super.appFlavor,super.httpClient, super.appDatabase, super.logger,
      );

  @override
  Future<void> register(final RegisterDto registerDto) async {
    final LoginResponseModel response = await post(
        url: 'customer/auth/signup',
        parameters: registerDto.toJson(),
        mapper: LoginResponseModel.fromJson,
        needLocation: false);
    await logger.logEvent(() async => FirebaseAnalytics.instance.logSignUp(
        signUpMethod: 'Email', parameters: {'email': registerDto.email}));
    await logger.logEvent(() async =>
        FirebaseAnalytics.instance.setUserId(id: registerDto.email));
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
      logger.logEvent(() async => FirebaseAnalytics.instance
          .logLogin(loginMethod: loginMethod, parameters: {'email': email})),
      logger
          .logEvent(() async => FirebaseAnalytics.instance.setUserId(id: email))
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
  Future<LoginResponseModel> loginUsingApple(
      {required final String? referralCode}) async {
    final AppleSignInResponseModel signInResponse =
        await socialMediaModule.loginByApple();

    final LoginResponseModel responseModel = await _login(
        url: 'customer/auth/apple/login',
        loginMethod: 'Apple',
        email: signInResponse.email,
        parameters: {
          'token': signInResponse.token,
          'name': signInResponse.name,
          if (referralCode != null) 'referralCode': referralCode
        });
    return responseModel;
  }

  @override
  Future<LoginResponseModel> loginUsingFacebook(
      {required final String? referralCode}) async {
    final FacebookSignInResponseModel signInResponse =
        await socialMediaModule.loginByFacebook();
    final LoginResponseModel responseModel = await _login(
        url: 'customer/auth/facebook/login',
        loginMethod: 'Facebook',
        email: signInResponse.email,
        parameters: {
          ...signInResponse.toJson(),
          if (referralCode != null) 'referralCode': referralCode,
        });
    return responseModel;
  }

  @override
  Future<LoginResponseModel> loginUsingGmail(
      {required final String? referralCode}) async {
    final GoogleSignInResponseModel signInResponse =
        await socialMediaModule.loginByGmail();

    final LoginResponseModel responseModel = await _login(
        url: 'customer/auth/google/login',
        loginMethod: 'Gmail',
        email: signInResponse.email,
        parameters: {
          'token': signInResponse.token,
          if (referralCode != null) 'referralCode': referralCode
        });
    return responseModel;
  }

  @override
  Future<void> sendPhoneNumberConfirmationCode(
          {required final String phoneNumber}) =>
      post(
          url: 'customer/auth/resend-sms',
          needLocation: false,
          parameters: {'phoneNumber': phoneNumber},
          mapper: emptyMapper);
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
  Future<void> checkPhoneNumberConfirmationCode(
          {required final String phoneNumber, required final String otpCode}) =>
      post(
          url: 'customer/auth/verify-phone',
          mapper: emptyMapper,
          parameters: {
            'otp': otpCode,
            'phoneNumber': phoneNumber,
          },
          needLocation: false);

  @override
  Future<void> updateNotificationsToken() async {
    final String? notificationsToken = notificationsModule.token;
    if (notificationsToken != null) {
      await put(
          url: 'customers/ns-token',
          parameters: {
            'notificationToken': notificationsToken,
            'notificationServer': notificationsModule.providerType.name
          },
          mapper: emptyMapper,
          needLocation: false);
    }
  }

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

  Future<void> migrateLocalUserToOnline() async {
    await Future.wait([
      productsRepository.migrateLocalUserToOnline(),
    ]);
  }

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

  @override
  Future<void> setLastLocation({
    required final double latitude,
    required final double longitude,
    required final String? addressString,
    required final AddressModel? address,
  }) =>
      appDatabase.setLastLocation(
          latitude: latitude,
          longitude: longitude,
          addressString: addressString,
          address: address);
}
