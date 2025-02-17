import 'package:trend/data/models/core/location_model.dart';

class MapLocationSelectionPageArguments {
  final LocationModel? initialValue;
  final String title;
  final void Function(LocationModel, String?) onSubmitLocation;

  MapLocationSelectionPageArguments({
    required this.initialValue,
    required this.title,
    required this.onSubmitLocation,
  });
}
