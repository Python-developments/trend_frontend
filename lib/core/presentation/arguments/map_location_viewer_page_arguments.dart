import 'package:trend/core/presentation/assets.dart';
import 'package:trend/data/models/core/location_model.dart';

class MapLocationViewerPageArguments {
  final LocationModel location;
  final String iconPath, pageTitle;

  MapLocationViewerPageArguments(
      {required this.location,
      required this.pageTitle,
      this.iconPath = Assets.locationMarker});
}
