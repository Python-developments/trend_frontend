import 'package:trend/core/utils/enums.dart';

class LoginPageArguments {
  final HomeNavigationBarTileType homePageTile;
  final String? sharedReferralCode;
  final bool showGuestOption;
  LoginPageArguments(
      {required this.homePageTile,
      this.sharedReferralCode,
      this.showGuestOption = true});
}
