import 'dart:io';

import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:geocoding/geocoding.dart';
import 'package:trend/data/models/core/location_model.dart';
import 'package:trend/third_parties_modules/abstract/i_live_location_module.dart';
import 'package:trend/third_parties_modules/abstract/i_permissions_handler_module.dart';

@Singleton(as:ILiveLocationModule)
class LiveLocationModule extends ILiveLocationModule{
  final IPermissionsHandlerModule permissionsHandlerModule;

  LiveLocationModule(this.permissionsHandlerModule);
  @override
  Future<(LocationModel, String?)?>  getCurrentLocation({required final bool gracefully}) async{
    try{
      if(! await permissionsHandlerModule.hasGrantLocationPermission(gracefully: gracefully)) {
        return null;
      }

      final Position currentPosition = (await Geolocator.getCurrentPosition(
          locationSettings: Platform.isIOS?AppleSettings():AndroidSettings(forceLocationManager:true )
      ));

      final LocationModel result = LocationModel(currentPosition.latitude, currentPosition.longitude);
      await setLocaleIdentifier('en_US');
      final List<Placemark> placemarks = await placemarkFromCoordinates(result.latitude, result.longitude);
      final String? currentLocationString = placemarks[0].street;
      return (result,currentLocationString);
    }
    catch(e){
      return null;
    }

  }



}