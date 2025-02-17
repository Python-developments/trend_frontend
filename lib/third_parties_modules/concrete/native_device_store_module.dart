import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:injectable/injectable.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:store_redirect/store_redirect.dart';

import 'package:trend/third_parties_modules/abstract/i_native_device_store_module.dart';

@Singleton(as: INativeDeviceStoreModule)
class NativeDeviceStoreModule extends INativeDeviceStoreModule {
  @override
  void redirectToStore() {
    StoreRedirect.redirect(
        androidAppId: dotenv.get('androidAppId'),
        iOSAppId: dotenv.get('iosAppId'));
  }

  @override
  Future<String> get currentAppVersion async=>(await PackageInfo.fromPlatform()).version;

  @override
  void rateApp() {
    /* AdvancedInAppReview()
        .setMinDaysBeforeRemind(0)
        .setMinDaysAfterInstall(0)
        .setMinLaunchTimes(0)
        .setMinSecondsBeforeShowDialog(1)
        .monitor();*/
  }

}
