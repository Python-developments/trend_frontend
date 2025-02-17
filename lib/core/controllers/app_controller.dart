import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_huawei_availability/google_huawei_availability.dart';

import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:trend/core/controllers/app_settings_controller.dart';
import 'package:trend/core/controllers/auth_controller.dart';
import 'package:trend/core/controllers/base_controller.dart';
import 'package:trend/core/controllers/current_location_controller.dart';
import 'package:trend/core/controllers/localization_controller.dart';
import 'package:trend/core/presentation/arguments/map_location_selection_page_arguments.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/data/models/core/location_model.dart';
import 'package:trend/third_parties_modules/abstract/i_deep_linking_module.dart';
import 'package:trend/core/utils/flavors.dart';
import 'package:trend/third_parties_modules/abstract/i_notifications_module.dart';


part 'app_controller.g.dart';

@singleton
class AppController extends AppControllerBase with _$AppController {
  AppController(
      super.flavor,
      super.localizationController,
      super.notificationsModule,
      super.deepLinkingModule,
      super.appSettingsController,
      super.authController,
      super.currentLocationController,
      super.logger,super.appRouter,super.snakeBarShower);
}

abstract class AppControllerBase extends BaseController with Store {
  final Flavor flavor;
  final AuthController authController;
  final CurrentLocationController currentLocationController;
  final LocalizationController localizationController;
  final AppSettingsController appSettingsController;
  final INotificationsModule notificationsModule;
  final IDeepLinkingModule deepLinkingModule;
  late ReactionDisposer lastLocationReaction;
  AppControllerBase(
      this.flavor,
      this.localizationController,
      this.notificationsModule,
      this.deepLinkingModule,
      this.appSettingsController,
      this.authController,
      this.currentLocationController,
      super.logger,super.appRouter,super.snakeBarShower) {

    lastLocationReaction = reaction(
        (final _) => currentLocationController.userApplicationSurfingLocation,
        (final newLocation) {
      authController.changeUserLastLocation(
          latitude: newLocation.$1.latitude,
          longitude: newLocation.$1.longitude,
          addressString: newLocation.$2,
          address: currentLocationController.selectedAddress);
    });
  }

  @observable
  bool isHuaweiDevice = false;

  @override
  @action
  Future<void> loadData() => runStorePrimaryFunction(() async {

        await dotenv.load(fileName: '.env');

        try {
          isHuaweiDevice =
              !(await GoogleHuaweiAvailability.isGoogleServiceAvailable ??
                  true);
        } catch (_) {}

        await logger.init();

        /// asking for notifications permission and location permission making dialog conflicting so keep it here
        await notificationsModule.init();
        await Future.wait([
          appSettingsController.loadData(),
          localizationController.loadData(),
          deepLinkingModule.init(),
          currentLocationController.getCurrentLocation(),
        ]);

        await appSettingsController.checkAppStatus();
        await authController.loadData();


        //ignore:unawaited_futures
        Future.delayed(const Duration(seconds: 5)).then((final _) async {
          if (notificationsModule.initialMessage != null) {
            await notificationsModule.handleNotification(
                notificationsModule.initialMessage!.toJson());
          }
          if (deepLinkingModule.initialLink != null) {
            await deepLinkingModule.handleLink(deepLinkingModule.initialLink!);
          }
        });


           if (authController.cachedUser == null) {
             await _confirmLocation(currentLocationController.currentLocation ??
                 currentLocationController.userApplicationSurfingLocation.$1);
           }
           else {
             if (authController.cachedUser!.lastAddress != null) {
               currentLocationController
                   .changeSelectedAddress(authController.cachedUser!.lastAddress!);
               await appRouter.replace(HomeRouteNavigation());
             }
             else if (currentLocationController.currentLocation != null) {
               currentLocationController.changeSelectedLocation(
                   LocationModel(
                       currentLocationController.currentLocation!.latitude,
                       currentLocationController.currentLocation!.longitude),
                   currentLocationController.currentLocationString);
               await appRouter.replace(HomeRouteNavigation());
             }
             else {
               await _confirmLocation(LocationModel(
                   authController.cachedUser!.lastLocation.latitude,
                   authController.cachedUser!.lastLocation.longitude));
             }
           }


      }, onCatchError: (final _) async {
        await appRouter.replace(AppErrorRoute());
      });

  @action
  Future<void> changeAppLanguage(final String languageCode) =>
      runStoreSecondaryFunction(() async {
        await authController.changeUserLanguage(languageCode: languageCode);
        localizationController.changeLanguage(languageCode);
        await appRouter.replace(HomeRouteNavigation());
      });

  Future<void> _confirmLocation(final LocationModel initialLocation) =>
      appRouter.replace(MapLocationSelectionRoute(
          args: MapLocationSelectionPageArguments(
              title: 'Select delivery location',
              initialValue: initialLocation,
              onSubmitLocation: (final location, final addressString) async {
                currentLocationController.changeSelectedLocation(
                    location, addressString);
                await appRouter.replace(HomeRouteNavigation());
              })));

  @override
  void dispose() {
    lastLocationReaction();
    super.dispose();
  }
}
