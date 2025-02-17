import 'package:injectable/injectable.dart';
import 'package:trend/data/models/products/filtering_variant_key_model.dart';
import 'package:trend/data/models/core/pagination_data_model.dart';
import 'package:trend/data/models/orders/review_model.dart';
import 'package:trend/data/models/vendors/vendor_details_model.dart';
import 'package:trend/data/models/vendors/vendor_model.dart';
import 'package:trend/data/repositories/abstract/i_vendors_repository.dart';

@Singleton(as: IVendorsRepository)
class VendorsRepository extends IVendorsRepository {
  VendorsRepository(super.appFlavor,super.httpClient, super.appDatabase, super.logger,
      super.currentLocationController);

  @override
  Future<VendorDetailsModel> getVendorDetails({required final String id}) =>
      getObject(
          url: 'store/shops/$id',
          mapper: VendorDetailsModel.fromJson,
          needLocation: true);

  @override
  Future<PaginationDataModel<ReviewModel>> getVendorReviews(
          {required final String vendorId,
          required final int pageNumber,
          required final int perPage}) async =>
      getPagination(
        url: 'store/reviews/$vendorId',
        page: pageNumber,
        perPage: perPage,
        parameters: {},
        mapper: ReviewModel.fromJson,
        needLocation: true,
      );

  @override
  Future<PaginationDataModel<VendorModel>> searchVendors(
          {required final String? searchString,
          required final int pageNumber,
          required final int perPage}) =>
      getPagination(
          url: 'store/shops',
          page: pageNumber,
          perPage: perPage,
          parameters: {'search': searchString},
          mapper: VendorModel.fromJson,
          needLocation: true);

  @override
  Future<PaginationDataModel<VendorModel>> getCategoryVendors(
          {required final String categoryId,
          required final int pageNumber,
          required final int perPage,
          final String? searchString,}) =>
      getPagination(
          url: 'store/shops',
          needLocation: true,
          page: pageNumber,
          perPage: perPage,
          parameters: {'category': categoryId, 'search': searchString},
          mapper: VendorModel.fromJson);

  @override
  Future<List<FilteringVariantKeyModel>> getVendorVariantsFilters(
          {required final String vendorId}) =>
      getList(
          url: 'store/shops/$vendorId/filters',
          mapper: FilteringVariantKeyModel.fromJson,
          needLocation: true);

  @override
  Future<List<VendorModel>> getPrimaryBannerVendors(
          {required final String bannerId}) =>
      getList(
          url: 'store/banners/$bannerId',
          mapper: VendorModel.fromJson,
          needLocation: true);
}
