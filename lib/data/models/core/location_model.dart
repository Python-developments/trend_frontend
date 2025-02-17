import 'dart:math';

import 'package:json_annotation/json_annotation.dart';
import 'package:trend/data/models/orders/location_tracking_message_model.dart';
import 'package:ultra_map_place_picker/ultra_map_place_picker.dart' as ultra;

import 'package:trend/core/utils/global.dart';

part 'location_model.g.dart';

@JsonSerializable()
class LocationModel {

  @JsonKey(defaultValue:Global.generateDefaultValue ? 0.0:null)
  final double latitude, longitude;

  LocationModel(this.latitude, this.longitude);

  factory LocationModel.fromJson(final Map<String, dynamic> data) =>
      _$LocationModelFromJson(data);

  factory LocationModel.fromLocationTrackingMessage(
          final NewLocationMessage trackingMessage) =>
      LocationModel(trackingMessage.latitude, trackingMessage.longitude);
  Map<String, dynamic> toJson() => _$LocationModelToJson(this);

  factory LocationModel.empty() => LocationModel(
        0.0,
        0.0,
      );

  double distanceFrom(final LocationModel other) {
    final double lat1 = latitude * pi / 180;
    final double lon1 = longitude * pi / 180;
    final double lat2 = other.latitude * pi / 180;
    final double lon2 = other.longitude * pi / 180;
    const double R = 6371e3; // Earth's radius in meters

    final double dLat = lat2 - lat1;
    final double dLon = lon2 - lon1;

    final double a = sin(dLat / 2) * sin(dLat / 2) +
        cos(lat1) * cos(lat2) * sin(dLon / 2) * sin(dLon / 2);
    final double c = 2 * atan2(sqrt(a), sqrt(1 - a));
    return R * c;
  }

  bool isInsidePolygon(final List<LocationModel> polygonPoints) {
    int intersectCount = 0;
    for (int j = 0; j < polygonPoints.length - 1; j++) {
      if (_rayCastIntersect(this, polygonPoints[j], polygonPoints[j + 1])) {
        intersectCount++;
      }
    }

    return ((intersectCount % 2) == 1); // odd = inside, even = outside;
  }

  bool _rayCastIntersect(final LocationModel tap, final LocationModel vertA,
      final LocationModel vertB) {
    final double aY = vertA.latitude;
    final double bY = vertB.latitude;
    final double aX = vertA.longitude;
    final double bX = vertB.longitude;
    final double pY = tap.latitude;
    final double pX = tap.longitude;

    if ((aY > pY && bY > pY) || (aY < pY && bY < pY) || (aX < pX && bX < pX)) {
      return false; // a and b can't both be above or below pt.y, and a or
      // b must be east of pt.x
    }

    if (aX == bX) {
      return true;
    }
    final double m = (aY - bY) / (aX - bX); // Rise over run
    final double bee = (-aX) * m + aY; // y = mx + b
    final double x = (pY - bee) / m; // algebra is neat!

    return x > pX;
  }

  factory LocationModel.fromUltra(final ultra.LocationModel other) =>
      LocationModel(other.latitude, other.longitude);
  ultra.LocationModel get ultraLocationModel =>
      ultra.LocationModel(latitude, longitude);
}
