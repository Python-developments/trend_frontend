import 'dart:async';

import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:location/location.dart' as lc;
import 'package:permission_handler/permission_handler.dart' as ph;
import 'package:trend/core/presentation/dialogs/grant_permission_dialog.dart';
import 'package:trend/core/presentation/dialogs/show_custom_dialog.dart';
import 'package:trend/third_parties_modules/abstract/i_permissions_handler_module.dart';

@Singleton(as:IPermissionsHandlerModule)
class PermissionsHandlerModule extends IPermissionsHandlerModule{


  @override
  Future<bool> hasGrantLocationPermission({required final bool gracefully})async{
    final lc.Location location = lc.Location();

    bool isLocationServiceEnabled = await location.serviceEnabled();
    if (!isLocationServiceEnabled && !gracefully) {
      isLocationServiceEnabled = await location.requestService();
      if (!isLocationServiceEnabled) {
        unawaited(showCustomDialog(dialog: GrantPermissionDialog(permissionName: 'location')));
        return false;
      }
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied && !gracefully) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        unawaited(showCustomDialog(dialog: GrantPermissionDialog(permissionName: 'location')));

        return false;
      }
    }

    if (permission == LocationPermission.deniedForever && !gracefully) {
      unawaited(showCustomDialog(dialog: GrantPermissionDialog(permissionName: 'location')));
      return false;
    }

    return true;
  }

  @override
  Future<bool> hasGrantCameraPermission() async{
    if(await ph.Permission.camera.isGranted|| await ph.Permission.camera.isLimited) {
      return true;
    }
    await ph.Permission.camera.request();
    if(await ph.Permission.camera.isGranted|| await ph.Permission.camera.isLimited) {
      return true;
    }

    unawaited(showCustomDialog(dialog: GrantPermissionDialog(permissionName: 'camera')));
    return false;
  }


  @override
  Future<bool> hasGrantPhotosPermission() async{

    if(await ph.Permission.photos.isGranted|| await ph.Permission.photos.isLimited) {
      return true;
    }
    final ph.PermissionStatus status = await ph.Permission.photos.request();
    if(status.isGranted|| status.isLimited) {
      return true;
    }

    unawaited(showCustomDialog(dialog: GrantPermissionDialog(permissionName: 'photos')));
    return false;
  }

  @override
  Future<void> openAppSettings()=>ph.openAppSettings();


}