import 'package:trend/data/models/auth/apple_sign_in_response_model.dart';
import 'package:trend/data/models/auth/facebook_sign_in_response_model.dart';
import 'package:trend/data/models/auth/google_sign_in_response_model.dart';
import 'package:trend/third_parties_modules/abstract/i_module.dart';

abstract class ISocialMediaModule extends IModule {
  Future<GoogleSignInResponseModel> loginByGmail();
  Future<AppleSignInResponseModel> loginByApple();
  Future<FacebookSignInResponseModel> loginByFacebook();
}
