import 'package:trend/data/models/products/filtering_variant_key_model.dart';
import 'package:trend/data/models/core/pagination_data_model.dart';
import 'package:trend/data/models/orders/review_model.dart';
import 'package:trend/data/models/vendors/vendor_details_model.dart';
import 'package:trend/data/models/vendors/vendor_model.dart';
import 'package:trend/data/repositories/abstract/i_repository_impl.dart';

abstract class IVendorsRepository extends IRepositoryImpl {
  IVendorsRepository(super.appFlavor,super.httpClient, super.appDatabase, super.logger,
      super.currentLocationController);

  Future<PaginationDataModel<VendorModel>> getCategoryVendors(
      {required final String categoryId,
      required final int pageNumber,
      required final int perPage,
      final String? searchString,});
  Future<VendorDetailsModel> getVendorDetails({required final String id});
  Future<PaginationDataModel<VendorModel>> searchVendors({
    required final String? searchString,
    required final int pageNumber,
    required final int perPage,
  });
  Future<List<VendorModel>> getPrimaryBannerVendors(
      {required final String bannerId});
  Future<PaginationDataModel<ReviewModel>> getVendorReviews(
      {required final String vendorId,
      required final int pageNumber,
      required final int perPage});
  Future<List<FilteringVariantKeyModel>> getVendorVariantsFilters(
      {required final String vendorId});
}
