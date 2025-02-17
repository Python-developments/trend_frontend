import 'package:injectable/injectable.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/dtos/products_filter_dto.dart';
import 'package:trend/data/local_database/entities/product_entity.dart';
import 'package:trend/data/models/core/pagination_data_model.dart';
import 'package:trend/data/models/products/product_details_model.dart';
import 'package:trend/data/models/products/product_model.dart';
import 'package:trend/data/models/products/vendor_products_search_model.dart';

import 'package:trend/data/models/vendors/vendor_category_product_model.dart';
import 'package:trend/data/repositories/abstract/i_products_repository.dart';
import 'package:trend/data/repositories/abstract/i_repository_impl.dart';

@Singleton(as: IProductsRepository)
class ProductsRepository extends IProductsRepository {
  ProductsRepository(super.currentLocationController,super.appFlavor,super.httpClient, super.appDatabase, super.logger,);

  @override
  Future<List<ProductModel>> getFavoriteProducts(
      {required final bool isOfflineSave}) async {
    return isOfflineSave
        ? (await appDatabase.getProductsByType(
                cacheType: ProductsCacheType.favorites))
            .map((final e) => e.toProductModel())
            .toList()
        : await getList(
            url: 'store/favorites',
            needLocation: false,
            mapper: ProductModel.fromJson);
  }

  @override
  Future<ProductDetailsModel> getProductDetails(
          {required final String productId}) =>
      getObject(
          url: 'store/products/$productId',
          needLocation: true,
          mapper: ProductDetailsModel.fromJson);

  @override
  Future<List<ProductModel>> getSimilarProducts(
          {required final String productId}) =>
      getList(
          url: 'store/products/$productId/similar',
          mapper: ProductModel.fromJson,
          needLocation: true);
  @override
  Future<List<VendorCategoryProductModel>> getVendorCategoryProducts({
    required final String vendorId,
  }) =>
      getList(
          url: 'store/shops/$vendorId/products',
          parameters: {'limit': 1000},
          mapper: VendorCategoryProductModel.fromJson,
          needLocation: true);
  @override
  Future<PaginationDataModel<ProductModel>> getVendorFilteredProducts({
    required final String vendorId,
    required final String? searchString,
    required final ProductsFilterDto? filter,
    required final int page,
    required final int perPage,
  }) =>
      getPagination(
          url: 'store/shops/$vendorId/search',
          page: page,
          perPage: perPage,
          parameters: {'search': searchString, ...filter?.toJson() ?? {}},
          needLocation: true,
          mapper: ProductModel.fromJson);

  @override
  Future<void> removeFromFavorites(
      {required final String productId,
      required final bool isOfflineSave}) async {
    if (isOfflineSave) {
      await appDatabase.deleteProduct(
          id: productId, cacheType: ProductsCacheType.favorites);
    } else {
      await delete(url: 'store/favorites/$productId', needLocation: false);
    }
  }

  @override
  Future<PaginationDataModel<VendorProductSearchModel>> searchProducts(
          {required final String? searchString,
          required final int pageNumber,
          required final int perPage}) async =>
      getPagination(
          url: 'store/products',
          page: pageNumber,
          perPage: perPage,
          parameters: {'search': searchString},
          mapper: VendorProductSearchModel.fromJson,
          needLocation: true);

  @override
  Future<void> addToFavorites(
      {required final ProductModel product,
      required final bool isOfflineSave}) async {
    if (isOfflineSave) {
      await appDatabase.insertProduct(
          ProductEntity.fromProductModel(product, ProductsCacheType.favorites));
    } else {
      await post(
          url: 'store/favorites/${product.id}',
          parameters: {},
          mapper: emptyMapper,
          needLocation: false);
    }
  }

  @override
  Future<void> migrateLocalUserToOnline() async {
    final List<ProductEntity> products = await appDatabase.getProductsByType(
        cacheType: ProductsCacheType.favorites);
    for (ProductEntity product in products) {
      await addToFavorites(
          product: product.toProductModel(), isOfflineSave: false);
      await appDatabase.deleteProduct(
          id: product.id, cacheType: product.productCacheType);
    }
  }
}
