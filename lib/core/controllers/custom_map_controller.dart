import 'dart:async';

import 'package:google_maps_flutter/google_maps_flutter.dart' as gm;
import 'package:huawei_map/huawei_map.dart' as hm;
import 'package:trend/data/models/core/location_model.dart';

class CustomMapController {
  gm.GoogleMapController? _googleMapController;
  hm.HuaweiMapController? _huaweiMapController;

  void completeGoogleController(final gm.GoogleMapController controller) {
    _googleMapController = controller;
    Completer().complete(_googleMapController);
  }

  void completeHuaweiController(final hm.HuaweiMapController controller) {
    _huaweiMapController = controller;
    Completer().complete(_huaweiMapController);
  }

  void animateCamera(final LocationModel newLocation) {
    _googleMapController?.animateCamera(gm.CameraUpdate.newLatLng(
        gm.LatLng(newLocation.latitude, newLocation.longitude)));
    _huaweiMapController?.animateCamera(hm.CameraUpdate.newLatLng(
        hm.LatLng(newLocation.latitude, newLocation.longitude)));
  }
}
