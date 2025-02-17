import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:injectable/injectable.dart';

import 'package:sign_in_with_apple/sign_in_with_apple.dart';
import 'package:trend/data/errors/core_errors.dart';
import 'package:trend/data/errors/custom_error.dart';
import 'package:trend/data/models/auth/apple_sign_in_response_model.dart';
import 'package:trend/data/models/auth/facebook_sign_in_response_model.dart';
import 'package:trend/data/models/auth/google_sign_in_response_model.dart';
import 'package:trend/third_parties_modules/abstract/i_social_media_module.dart';

@Singleton(as: ISocialMediaModule)
class SocialMediaModule extends ISocialMediaModule {
  @override
  Future<GoogleSignInResponseModel> loginByGmail() async {
    final GoogleSignIn googleSignIn = GoogleSignIn(
        scopes: ['email'],
        clientId: Platform.isAndroid
            ? '691002371897-2b0mj7heu51r41pneegmgfgfjso6nbo0.apps.googleusercontent.com'
            : null);
    if (await googleSignIn.isSignedIn()) {
      await googleSignIn.disconnect();
    }
    final GoogleSignInAccount? googleUser = await googleSignIn.signIn();

    if (googleUser == null) {
      throw IsNotSelectedError(fieldName: 'user');
    }
    final GoogleSignInAuthentication googleAuth =
        await googleUser.authentication;
    return GoogleSignInResponseModel(
        token: googleAuth.idToken ?? '', email: googleUser.email);
  }

  @override
  Future<AppleSignInResponseModel> loginByApple() async {
    try {
      final AuthorizationCredentialAppleID credential =
          await SignInWithApple.getAppleIDCredential(
        scopes: [
          AppleIDAuthorizationScopes.email,
          AppleIDAuthorizationScopes.fullName,
        ],
      );
      if (credential.identityToken == null) {
        throw IsNotSelectedError(fieldName: 'user');
      }
      final String? fullName = credential.givenName == null
          ? null
          : '${credential.givenName} ${credential.familyName}';
      return AppleSignInResponseModel(
          email: credential.email ?? '',
          name: fullName,
          token: credential.identityToken);
    } catch (_) {
      throw IsNotSelectedError(fieldName: 'user');
    }
  }

  @override
  Future<FacebookSignInResponseModel> loginByFacebook() async {
    /// flutter facebook auth
    try {
      await FacebookAuth.instance.logOut();
      final LoginResult result = await FacebookAuth.instance.login(
        nonce: _generateNonce(),
      );
      if (result.status == LoginStatus.cancelled) {
        throw IsNotSelectedError(fieldName: 'user');
      } else if (result.status == LoginStatus.failed) {
        throw SomethingWentWrongError();
      }
      final AccessToken? userAccessToken =
          await FacebookAuth.instance.accessToken;

      final Map<String, dynamic> userData =
          await FacebookAuth.instance.getUserData();
      return FacebookSignInResponseModel(
          token: userAccessToken?.tokenString ?? '',
          email: userData['email'] ?? '',
          tokenType: userAccessToken is LimitedToken ? 'oidc' : 'accessToken');
    } on CustomError {
      rethrow;
    } catch (e) {
      throw SomethingWentWrongError();
    }

    /// facebook login auth
    /*
          try {
            final FacebookLogin facebookLogin = FacebookLogin();

            await facebookLogin.logOut();
            final FacebookLoginResult result = await facebookLogin.logIn(permissions: [
              FacebookPermission.publicProfile,
              FacebookPermission.email,
            ]);

            'Wiso $result'.debugPrint();
            if (result.status == FacebookLoginStatus.cancel) {
              throw IsNotSelectedError(fieldName: 'user');
            } else if (result.status == FacebookLoginStatus.error)
              throw SomethingWentWrongError();
            final FacebookAccessToken? userAccessToken = await facebookLogin.accessToken;
            if (userAccessToken?.isLimitedLogin==true) {

            }

            final Map<String, dynamic> userData = await FacebookLogin.fge();
            return FacebookSignInResponseModel(
                token: userAccessToken?.token ?? '', email: await facebookLogin.getUserEmail()?? '', tokenType: 'oidc');
          }
          on CustomError {
            rethrow;
          }catch (e) {
            'Wiso error ${e.toString()}'.debugPrint();
            throw SomethingWentWrongError();
          }*/
  }

  /// Generates a cryptographically secure random nonce of the specified length.
  /// Defaults to 32 characters, which is recommended for most use cases.
  String _generateNonce([final int length = 32]) {
    const String charset =
        '0123456789ABCDEFGHIJKLMNOPQRSTUVXYZabcdefghijklmnopqrstuvwxyz-._';
    return List.generate(length,
        (final _) => charset[Random.secure().nextInt(charset.length)]).join();
  }
}
