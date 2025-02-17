


import 'package:trend/third_parties_modules/abstract/i_module.dart';

abstract class IPermissionsHandlerModule extends IModule {

  Future<bool> hasGrantLocationPermission({required final bool gracefully});
  Future<bool> hasGrantCameraPermission();
  Future<bool> hasGrantPhotosPermission();
  Future<void> openAppSettings();

}