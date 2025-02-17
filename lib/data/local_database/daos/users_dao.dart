import 'package:drift/drift.dart';
import 'package:trend/data/local_database/databases/concrete/app_local_database.dart';
import 'package:trend/data/local_database/entities/user_entity.dart';
import 'package:trend/data/local_database/tables/users.dart';
import 'package:trend/data/models/address_model.dart';
part 'users_dao.g.dart';

@DriftAccessor(tables: [Users])
class UsersDao extends DatabaseAccessor<AppLocalDatabase> with _$UsersDaoMixin {
  UsersDao(super.attachedDatabase);

  Future<UserEntity?> getCurrentUser() async {
    final User? result = await select(attachedDatabase.users).getSingleOrNull();
    return result != null ? UserEntity.fromLocalUser(result) : null;
  }

  Future<void> setToken(final String newToken) async {
    final UserEntity currentUser = (await getCurrentUser())!;
    await _deleteUser();
    await into(attachedDatabase.users).insert(User(
      token: newToken,
      lastLocationLatitude: currentUser.lastLocation.latitude,
      lastLocationLongitude: currentUser.lastLocation.longitude,
      lastLocationString: currentUser.lastLocationString,
      addressId: newToken.isNotEmpty ? currentUser.lastAddress?.id : null,
      addressTitle: newToken.isNotEmpty ? currentUser.lastAddress?.title : null,
      addressArea: newToken.isNotEmpty ? currentUser.lastAddress?.area : null,
      addressAdditionalInfo:
          newToken.isNotEmpty ? currentUser.lastAddress?.additionalInfo : null,
      addressDescription: newToken.isNotEmpty
          ? currentUser.lastAddress?.addressDescription
          : null,
    ));
    return;
  }

  Future<void> setLastLocation(
      {required final double latitude,
      required final double longitude,
      required final String? addressString,
      required final AddressModel? address}) async {
    final UserEntity? currentUser = await getCurrentUser();
    await _deleteUser();
    await into(attachedDatabase.users).insert(User(
        token: currentUser?.token ?? '',
        lastLocationLatitude: latitude,
        lastLocationLongitude: longitude,
        lastLocationString: addressString,
        addressId: address?.id,
        addressTitle: address?.title,
        addressArea: address?.area,
        addressDescription: address?.addressDescription,
        addressAdditionalInfo: address?.additionalInfo));
    return;
  }

  Future<void> _deleteUser() => attachedDatabase.users.deleteAll();
}
