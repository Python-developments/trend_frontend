import 'package:injectable/injectable.dart';
import 'package:trend/data/dtos/address_dto.dart';
import 'package:trend/data/models/address_model.dart';
import 'package:trend/data/repositories/abstract/i_addresses_repository.dart';

@Singleton(as: IAddressesRepository)
class AddressesRepository extends IAddressesRepository {
  AddressesRepository(super.appFlavor,super.httpClient, super.appDatabase, super.logger,
      super.currentLocationController);
  @override
  Future<void> deleteAddress({required final String id}) =>
      delete(url: 'customers/profile/addresses/$id', needLocation: false);



  @override
  Future<AddressModel> addNewAddress({required final AddressDto addressDto}) =>
      post(
          url: 'customers/profile/addresses',
          parameters:addressDto.toJson(),
          mapper: AddressModel.fromJson,
          needLocation: false);
  @override
  Future<AddressModel> editAddress(
          {required final String id, required final AddressDto addressDto}) =>
      put(
          url: 'customers/profile/addresses/$id',
          parameters:addressDto.toJson(),
          mapper: AddressModel.fromJson,
          needLocation: false);
}
