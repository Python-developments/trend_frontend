import 'package:trend/third_parties_modules/abstract/i_module.dart';

abstract class INativeDeviceStoreModule extends IModule {

  void redirectToStore();
  Future<String> get currentAppVersion;
  void rateApp();
}
