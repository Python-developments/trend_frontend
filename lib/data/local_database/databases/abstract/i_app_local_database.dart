import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/local_database/entities/product_entity.dart';
import 'package:trend/data/local_database/entities/search_history_entity.dart';
import 'package:trend/data/local_database/entities/user_entity.dart';
import 'package:trend/data/local_database/entities/vendor_entity.dart';
import 'package:trend/data/models/address_model.dart';
import 'package:trend/data/models/event_model.dart';
import 'package:trend/data/models/vendors/vendor_category_product_model.dart';

abstract class IAppLocalDatabase {
  Future<void> clearUserCache();
  void close();

  Future<void> insertProduct(final ProductEntity singleProduct);
  Future<List<ProductEntity>> getProductsByType({required final ProductsCacheType cacheType});
  Future<void> deleteProduct({required final String id, required final ProductsCacheType cacheType});
  Future<void> deleteAllProductsOfType({required final ProductsCacheType cacheType});

  Future<void> insertSearch(final SearchHistoryEntity singleSearch);
  Future<List<SearchHistoryEntity>> getSearchesByType({required final SearchCacheType cacheType});
  Future<void> deleteSearchHistory(final SearchHistoryEntity item);
  Future<void> deleteAllSearchHistoriesOfType({required final SearchCacheType cacheType});

  Future<UserEntity?> getCurrentUser();

  Future<void> setToken(final String newToken);

  Future<void> setLastLocation(
      {required final double latitude,
      required final double longitude,
      required final String? addressString,
      required final AddressModel? address});

  Future<void> insertSearchVendor(final VendorEntity singleVendor);
  Future<List<VendorEntity>> getAllVendors();
  Future<void> deleteAllVendors();
  Future<List<VendorCategoryProductModel>> getVendorProducts({required final String vendorId});
  Future<void> insertVendorProducts({required final String vendorId, required final List<VendorCategoryProductModel> vendorProducts});

  Future<List<EventModel>> getUserEvents();
  Future<void> upsertUserEvent({required final EventModel event});
  Future<EventModel> getUserEvent({required final String eventId});
  Future<void> deleteUserEvent({required final String eventId});
  Future<void> insertUserEvents({required final List<EventModel> events});
}
