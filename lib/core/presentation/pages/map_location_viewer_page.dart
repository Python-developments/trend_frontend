import 'dart:async';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import 'package:huawei_map/huawei_map.dart' as hm;
import 'package:ultra_map_place_picker/ultra_map_place_picker.dart';

import 'package:trend/core/controllers/app_controller.dart';
import 'package:trend/core/controllers/localization_controller.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/arguments/map_location_viewer_page_arguments.dart';
import 'package:trend/core/presentation/assets.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/core/presentation/sheets/custom_bottom_sheet.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';
import 'package:trend/core/presentation/widgets/main_button.dart';
import 'package:trend/core/utils/extensions.dart';
import 'package:trend/dependencies.dart';

@RoutePage()
class MapLocationViewerPage extends StatefulWidget {
  final MapLocationViewerPageArguments args;
  const MapLocationViewerPage({required this.args, super.key});

  @override
  MapLocationViewerPageState createState() => MapLocationViewerPageState();
}

class MapLocationViewerPageState extends State<MapLocationViewerPage> {
  final AppController appController = getIt<AppController>();
  GoogleMapController? googleMapController;
  hm.HuaweiMapController? huaweiMapController;
  BitmapDescriptor? initialLocationMarker;
  hm.BitmapDescriptor? initialLocationHuaweiMarker;


  @override
  void initState() {
    loadMarkerIcon();
    super.initState();
  }

  Future<void> loadMarkerIcon() async {
    initialLocationMarker = await BitmapDescriptor.asset(
        ImageConfiguration(size: Size(24.r, 24.r)), widget.args.iconPath);
    initialLocationHuaweiMarker = await hm.BitmapDescriptor.fromAssetImage(
        ImageConfiguration(size: Size(24.r, 24.r)), widget.args.iconPath);
    setState(() {});
  }

  @override
  Widget build(final BuildContext context) {
    return UltraMapPlacePicker(
          initialPosition: widget.args.location.ultraLocationModel,
          googleApiKey: dotenv.get('mapKey'),
        selectedPlaceWidgetBuilder: (
            final _,
            final PickResultModel? selectedPlace,
            final searchingState,
            final __,
            ) => CustomBottomSheet(
          sheetTitle: 'Set delivery location',
          height: 200,
          sheetWidget: SizedBox(
            width: double.infinity,
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24.w),
                  child: Row(
                    children: [
                      Container(
                          transform: !getIt<LocalizationController>()
                              .isRtlLanguage
                              ? Matrix4.rotationY(135)
                              : null,
                          transformAlignment: Alignment.center,
                          child: Image.asset(
                            Assets.deliveryCar,
                            height: 32.r,
                            width: 32.r,
                          )),
                      const CustomSizedBox(
                        width: 16,
                      ),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Your location'.translateWord,
                              style: AppStyle.textTheme.bodyMedium!
                                  .copyWith(
                                  color: AppStyle.black.shade600),
                            ),
                            const CustomSizedBox(
                              height: 4,
                            ),
                            Text(
                              selectedPlace?.formattedString ?? '',
                              style: AppStyle.textTheme.bodyMedium!
                                  .copyWith(
                                fontWeight: FontWeight.bold,
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                const CustomSizedBox(
                  height: 32,
                ),
                MainButton.wide(
                    title: 'Continue',
                    isLoading: false,
                    onPressed:getAppRouter.maybePop

                    ),
                const CustomSizedBox(
                  height: 16,
                ),
              ],
            ),
          ),
        ),
        enableScrolling: false,
        enableSearching: false,
        mapTypes: (final isHuaweiDevice) => isHuaweiDevice
            ? [
          UltraMapType.normal,
          UltraMapType.terrain,
        ]
            : [
          UltraMapType.normal,
          UltraMapType.hybrid,
        ],
        pinBuilder: (final _, final PinState state) => Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(8.r),
              decoration: BoxDecoration(
                  borderRadius: AppStyle.borderRadius,
                  color: AppStyle.black.shade400),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                         'Your order will\nbe delivered here',
                    style: AppStyle.textTheme.bodyMedium!.copyWith(
                        color: AppStyle.white, fontWeight: FontWeight.w600),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Icon(
              Icons.location_on_sharp
                  ,
              color: AppStyle.lightPrimaryColor,
              size: 40.r,
            ),
            const CustomSizedBox(
              height: 104,
            ),
          ],
        ),


    );
  }
}
