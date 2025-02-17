import 'package:trend/data/models/address_model.dart';
import 'package:trend/data/models/core/location_model.dart';

class AddressDetailsPageArguments {
  final AddressModel? address;
  final LocationModel initialLocation;
  final void Function() addressPageRefresher;
  final String? addressString;
  AddressDetailsPageArguments(
      {required this.addressPageRefresher,
      required this.address,
      required this.initialLocation,
      required this.addressString});
}
