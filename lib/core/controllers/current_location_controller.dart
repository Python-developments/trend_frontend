
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:trend/core/controllers/base_controller.dart';
import 'package:trend/data/models/address_model.dart';
import 'package:trend/data/models/core/location_model.dart';
import 'package:trend/third_parties_modules/abstract/i_live_location_module.dart';
part 'current_location_controller.g.dart';

@singleton
class CurrentLocationController extends CurrentLocationControllerBase
    with _$CurrentLocationController {
  CurrentLocationController(super.liveLocationModule,super.logger,super.appRouter,super.snakeBarShower);
}

abstract class CurrentLocationControllerBase extends BaseController with Store {
  final ILiveLocationModule liveLocationModule;
  CurrentLocationControllerBase(this.liveLocationModule,super.logger,super.appRouter,super.snakeBarShower);

  @action
  Future<void> getCurrentLocation() => runStoreSecondaryFunction(() async {
        final (LocationModel,String?)? liveLocation=await liveLocationModule.getCurrentLocation(gracefully: true);

    currentLocation =liveLocation?.$1;
    currentLocationString = liveLocation?.$2;
      });

  @action
  void changeSelectedLocation(
      final LocationModel newLocation, final String? newAddressString) {
    selectedAddress = null;
    selectedLocation = newLocation;
    addressString = newAddressString;
  }

  @action
  void changeSelectedAddress(final AddressModel newAddress) {
    selectedAddress = newAddress;
    addressString = newAddress.area;
    selectedLocation = null;
  }

  @observable
  LocationModel? currentLocation;
  @observable
  LocationModel? selectedLocation;
  @observable
  AddressModel? selectedAddress;
  @observable
  String? currentLocationString;
  @observable
  String? addressString;

  @computed
  (LocationModel, String?) get userApplicationSurfingLocation => (
        selectedAddress?.location ??
            selectedLocation ??
            LocationModel(25.1974767426511, 55.279669543133615),
        addressString
      );

  Future<bool> isNewLocationFarAway() async {
    if (selectedAddress != null || currentLocation == null) {
      return false;
    }
    final LocationModel oldLocation = currentLocation!;

    final (LocationModel,String?)? newLocation=await liveLocationModule.getCurrentLocation(gracefully: true);

    if (newLocation == null) {
      return false;
    }
    return oldLocation.distanceFrom(newLocation.$1) > 100;
  }
}
