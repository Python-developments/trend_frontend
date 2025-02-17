import 'package:injectable/injectable.dart';
import 'package:trend/data/models/primary_banner_model.dart';
import 'package:trend/data/models/vendors/vendor_banner_model.dart';
import 'package:trend/data/repositories/abstract/i_banners_repository.dart';

@Singleton(as: IBannersRepository)
class BannersRepository extends IBannersRepository {
  BannersRepository(super.appFlavor,super.httpClient, super.appDatabase, super.logger,
      super.currentLocationController);

  @override
  Future<List<PrimaryBannerModel>> getPrimaryBanner() => getList(
      url: 'store/banners',
      mapper: PrimaryBannerModel.fromJson,
      needLocation: true);

  @override
  Future<List<VendorBannerModel>> getVendorsBanner() async =>
      (await getPagination(
              url: 'store/sections',
              needLocation: true,
              page: 1,
              perPage: 20,
              parameters: {},
              mapper: VendorBannerModel.fromJson))
          .items;
}
