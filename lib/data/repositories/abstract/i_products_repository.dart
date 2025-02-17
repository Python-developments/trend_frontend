import 'package:trend/data/dtos/products_filter_dto.dart';
import 'package:trend/data/models/core/pagination_data_model.dart';
import 'package:trend/data/models/products/product_details_model.dart';
import 'package:trend/data/models/products/product_model.dart';

import 'package:trend/data/models/vendors/vendor_category_product_model.dart';
import 'package:trend/data/models/products/vendor_products_search_model.dart';
import 'package:trend/data/repositories/abstract/i_repository_impl.dart';

abstract class IProductsRepository extends IRepositoryImpl {
  IProductsRepository(super.currentLocationController,super.appFlavor,super.httpClient, super.appDatabase, super.logger,);

  Future<void> addToFavorites(
      {required final ProductModel product, required final bool isOfflineSave});
  Future<void> removeFromFavorites(
      {required final String productId, required final bool isOfflineSave});
  Future<List<VendorCategoryProductModel>> getVendorCategoryProducts({required final String vendorId,});

  Future<PaginationDataModel<ProductModel>> getVendorFilteredProducts(
      {required final String vendorId,
      required final String? searchString,
      required final ProductsFilterDto? filter,
      required final int page,
      required final int perPage});

  Future<ProductDetailsModel> getProductDetails({
    required final String productId,
  });
  Future<List<ProductModel>> getSimilarProducts(
      {required final String productId});
  Future<PaginationDataModel<VendorProductSearchModel>> searchProducts({
    required final String? searchString,
    required final int pageNumber,
    required final int perPage,
  });
  Future<List<ProductModel>> getFavoriteProducts(
      {required final bool isOfflineSave});

  Future<void> migrateLocalUserToOnline();
}
