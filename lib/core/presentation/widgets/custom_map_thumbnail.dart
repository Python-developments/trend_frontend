import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_map_place_picker/ultra_map_place_picker.dart';
import 'package:trend/core/controllers/app_controller.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/arguments/map_location_selection_page_arguments.dart';
import 'package:trend/core/presentation/arguments/map_location_viewer_page_arguments.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/core/utils/mixins.dart';
import 'package:trend/data/models/core/location_model.dart'as loc;

class CustomMapThumbnail extends StatelessWidget
    with WidgetControllerCreatorMixin<AppController> {
  final loc.LocationModel location;
  final String mapTitle;
  final void Function(loc.LocationModel, String?)? onMapLocationChanged;
  CustomMapThumbnail(
      {required this.mapTitle,
      required this.location,
      required this.onMapLocationChanged,
      super.key});

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap:(){
        if (onMapLocationChanged != null) {
      getAppRouter.push(MapLocationSelectionRoute(
          args: MapLocationSelectionPageArguments(
              title: mapTitle,
              initialValue: location,
              onSubmitLocation: (final latLng, final locationString) =>
                  onMapLocationChanged!(latLng, locationString))));
    } else {
    getAppRouter.push(MapLocationViewerRoute(
    args: MapLocationViewerPageArguments(
    location: location,
    pageTitle: mapTitle,
    )));
        }
      },
      child: UltraMapThumbnail(
        width: double.infinity,
          height: 200.h,
          initialPosition:location.ultraLocationModel,
        googleApiKey: dotenv.get('mapKey'),
        mapTypes: (final isHuaweiDevice) => isHuaweiDevice
        ? [
        UltraMapType.normal,
        UltraMapType.terrain,
        ]
            : [
        UltraMapType.normal,
        UltraMapType.hybrid,
        ],
        pinBuilder: (final _, final PinState state) => Icon(
              Icons.location_on_sharp,
              color: AppStyle.lightPrimaryColor,
              size: 40.r,
            ),
      ),
    );

  }
}
