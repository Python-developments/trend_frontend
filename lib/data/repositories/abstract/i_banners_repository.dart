import 'package:trend/data/models/primary_banner_model.dart';
import 'package:trend/data/models/vendors/vendor_banner_model.dart';
import 'package:trend/data/repositories/abstract/i_repository_impl.dart';

abstract class IBannersRepository extends IRepositoryImpl {
  IBannersRepository(super.appFlavor,super.httpClient, super.appDatabase, super.logger,
      super.currentLocationController);
  Future<List<PrimaryBannerModel>> getPrimaryBanner();
  Future<List<VendorBannerModel>> getVendorsBanner();
}
