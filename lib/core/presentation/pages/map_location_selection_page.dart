import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:ultra_map_place_picker/ultra_map_place_picker.dart';
import 'package:trend/core/controllers/app_controller.dart';
import 'package:trend/core/controllers/localization_controller.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/arguments/map_location_selection_page_arguments.dart';
import 'package:trend/core/presentation/assets.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/core/presentation/sheets/custom_bottom_sheet.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';
import 'package:trend/core/presentation/widgets/main_button.dart';
import 'package:trend/core/utils/extensions.dart';
import 'package:trend/core/utils/mixins.dart';
import 'package:trend/dependencies.dart';
import 'package:trend/data/models/core/location_model.dart' as lm;
import 'package:trend/third_parties_modules/abstract/i_permissions_handler_module.dart';

@RoutePage()
class MapLocationSelectionPage extends StatefulWidget {
  final MapLocationSelectionPageArguments args;

  const MapLocationSelectionPage({required this.args, super.key});

  @override
  State<MapLocationSelectionPage> createState() =>
      _MapLocationSelectionPageState();
}

class _MapLocationSelectionPageState extends State<MapLocationSelectionPage>
    with OnChangeDependenciesMixin<MapLocationSelectionPage> {
  late bool isInsidePolygon;
  final AppController appController = getIt<AppController>();
  final IPermissionsHandlerModule permissionsHandler=getIt<IPermissionsHandlerModule>();


  @override
  void onChangeDependencies() {
    isInsidePolygon = (widget.args.initialValue ??
            lm.LocationModel(25.1974767426511, 55.279669543133615))
        .isInsidePolygon(dubaiPolygon
            .map((final p) => lm.LocationModel.fromUltra(p))
            .toList());
    if (appController.isHuaweiDevice) {}
  }

  void changeIsInsidePolygon(final bool newValue) => setState(() {
        isInsidePolygon = newValue;
      });

  @override
  Widget build(final BuildContext context) {
    return UltraMapPlacePicker(
      googleApiKey: dotenv.get('mapKey'),
      initialPosition: widget.args.initialValue != null
          ? widget.args.initialValue!.ultraLocationModel
          : LocationModel(25.1974767426511, 55.279669543133615),
      myLocationButtonCooldown: 1,
      polygons: {
        UltraPolygonModel(
          polygonId: 'polygon',
          points: dubaiPolygon,
          fillColor: AppStyle.lightPink.withOpacity(0.1),
          strokeColor: AppStyle.lightPrimaryColor,
          strokeWidth: 1,
        ),
      },
      mapTypes: (final isHuaweiDevice) => isHuaweiDevice
          ? [
              UltraMapType.normal,
              UltraMapType.terrain,
            ]
          : [
              UltraMapType.normal,
              UltraMapType.hybrid,
            ],
      initialZoomValue: 18,

      initialMapType: UltraMapType.normal,
      selectInitialPosition: true,
      ignoreLocationPermissionErrors: false,
      onLocationPermissionDenied: () => permissionsHandler.hasGrantLocationPermission(gracefully: false),
      selectText: 'Submit'.translateWord,
      selectedPlaceWidgetBuilder: (
        final _,
        final PickResultModel? selectedPlace,
        final searchingState,
        final __,
      ) =>
          !isInsidePolygon
              ? Container()
              : CustomBottomSheet(
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
                            title: 'Confirm delivery location',
                            isLoading: false,
                            onPressed: () {
                              if (selectedPlace != null) {
                                widget.args.onSubmitLocation(
                                    lm.LocationModel.fromUltra(
                                        selectedPlace.toLocationModel),
                                    selectedPlace.formattedString);
                                getAppRouter.maybePop();
                              }
                            }),
                        const CustomSizedBox(
                          height: 16,
                        ),
                      ],
                    ),
                  ),
                ),

      onCameraMove: (final cameraPosition) => changeIsInsidePolygon(
          lm.LocationModel.fromUltra(cameraPosition).isInsidePolygon(
              dubaiPolygon
                  .map((final p) => lm.LocationModel.fromUltra(p))
                  .toList())),
      pinBuilder: (final _, final PinState state) => Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (state == PinState.idle || !isInsidePolygon)
              ? Container(
                  padding: EdgeInsets.all(8.r),
                  decoration: BoxDecoration(
                      borderRadius: AppStyle.borderRadius,
                      color: AppStyle.black.shade400),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        (isInsidePolygon
                            ? 'Your order will\nbe delivered here'
                            : 'Cant deliver your\norder here').translateWord,
                        style: AppStyle.textTheme.bodyMedium!.copyWith(
                            color: AppStyle.white, fontWeight: FontWeight.w600),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                )
              : const CustomSizedBox(
                  height: 54,
                ),
          Icon(
            isInsidePolygon
                ? Icons.location_on_sharp
                : Icons.location_off_rounded,
            color: AppStyle.lightPrimaryColor,
            size: 40.r,
          ),
          const CustomSizedBox(
            height: 104,
          ),
        ],
      ),

      onPlacePicked: (final result) async {
        if (result.geometry == null) {
          return;
        }

        widget.args.onSubmitLocation(
            lm.LocationModel.fromUltra(result.toLocationModel),
            result.formattedAddress);
        await getAppRouter.maybePop();
      },
      resizeToAvoidBottomInset:
          false, // only works in page mode, less flickery, remove if wrong offsets
    );
  }
}

List<LocationModel> dubaiPolygon = [
  LocationModel(25.291695767080526, 55.41562974830029),
  LocationModel(25.302653200769775, 55.38658520658895),
  LocationModel(25.297341535661918, 55.37728931491173),
  LocationModel(25.297325340346546, 55.36710767355186),
  LocationModel(25.298063955448214, 55.36405370537051),
  LocationModel(25.300888459115825, 55.361353246299814),
  LocationModel(25.299077989286673, 55.353211768546885),
  LocationModel(25.308465502924474, 55.34717250709046),
  LocationModel(25.31607628919295, 55.35005330701373),
  LocationModel(25.32144286601379, 55.354353055481255),
  LocationModel(25.328888952202135, 55.35405809557643),
  LocationModel(25.324900006586677, 55.34624509446461),
  LocationModel(25.303378255259418, 55.29405668875668),
  LocationModel(25.287241028258094, 55.255579545355836),
  LocationModel(25.246665656836484, 55.24155512587599),
  LocationModel(25.267379111962228, 55.13756749645128),
  LocationModel(25.139805302948364, 55.121539679989795),
  LocationModel(25.1288742656484, 55.10586200167563),
  LocationModel(25.113282364156944, 55.10305438452677),
  LocationModel(25.078601835271677, 55.107735274842945),
  LocationModel(25.049163831118847, 55.06608329934264),
  LocationModel(25.034882981338207, 54.962653949750774),
  LocationModel(25.00135846812261, 54.94788412508293),
  LocationModel(24.969000387755226, 54.96915110196797),
  LocationModel(24.911284993514855, 54.90357465107735),
  LocationModel(24.867028971797595, 55.02006684033729),
  LocationModel(24.79708111906777, 55.08310269462436),
  LocationModel(24.86437275999693, 55.182827515734324),
  LocationModel(24.9516330106782, 55.23771071243972),
  LocationModel(24.988962577642294, 55.24810644882644),
  LocationModel(25.019299884532828, 55.28424391898142),
  LocationModel(24.986699639457463, 55.32534934192955),
  LocationModel(24.94942705863795, 55.345873430796125),
  LocationModel(24.953010886719383, 55.393363471021175),
  LocationModel(24.99156529043907, 55.434325730731295),
  LocationModel(25.001702371772506, 55.466709056712716),
  LocationModel(25.0879870723766, 55.395744506451834),
  LocationModel(25.126064172562955, 55.448740172603124),
  LocationModel(25.151573833313186, 55.485051587358754),
  LocationModel(25.172889446865074, 55.51172256112147),
  LocationModel(25.1918753022551, 55.53008886886519),
  LocationModel(25.20839768641426, 55.55185894404471),
  LocationModel(25.234868092097727, 55.56359016851073),
  LocationModel(25.26632374557603, 55.48098714583358),
  LocationModel(25.276856385629173, 55.45533660544805),
  LocationModel(25.282751105972537, 55.438500280587704),
  LocationModel(25.291695767080526, 55.41562974830029),
];
