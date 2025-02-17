import 'package:trend/data/local_database/databases/concrete/app_local_database.dart';
import 'package:trend/data/models/address_model.dart';
import 'package:trend/data/models/core/location_model.dart';

class UserEntity {
  final String token;
  final String? lastLocationString;
  final LocationModel lastLocation;
  final AddressModel? lastAddress;
  const UserEntity(
      {required this.token,
      required this.lastLocation,
      this.lastLocationString,
      this.lastAddress});

  factory UserEntity.fromLocalUser(final User user) => UserEntity(
      token: user.token,
      lastLocationString: user.lastLocationString,
      lastLocation:
          LocationModel(user.lastLocationLatitude, user.lastLocationLongitude),
      lastAddress: user.addressId != null
          ? AddressModel(
              id: user.addressId!,
              title: user.addressTitle!,
              addressDescription: user.addressDescription!,
              additionalInfo: user.addressAdditionalInfo,
              area: user.addressArea!,
              location: LocationModel(
                  user.lastLocationLatitude, user.lastLocationLongitude), )
          : null);
    factory UserEntity.empty()=> UserEntity(token: 'token', lastLocation: LocationModel.empty(),
        lastAddress: null,lastLocationString: 'Dubai');

}
