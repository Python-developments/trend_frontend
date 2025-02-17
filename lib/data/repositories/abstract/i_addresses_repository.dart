import 'package:trend/data/dtos/address_dto.dart';
import 'package:trend/data/models/address_model.dart';
import 'package:trend/data/repositories/abstract/i_repository_impl.dart';

abstract class IAddressesRepository extends IRepositoryImpl {
  IAddressesRepository(super.appFlavor,super.httpClient, super.appDatabase, super.logger,
      super.currentLocationController);

  Future<AddressModel> addNewAddress({required final AddressDto addressDto});

  Future<AddressModel> editAddress(
      {required final String id, required final AddressDto addressDto});

  Future<void> deleteAddress({required final String id});
}
