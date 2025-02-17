import 'package:drift/drift.dart';
import 'package:drift/native.dart';
import 'package:injectable/injectable.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/local_database/daos/events_dao.dart';
import 'package:trend/data/local_database/daos/products_dao.dart';
import 'package:trend/data/local_database/daos/search_histories_dao.dart';
import 'package:trend/data/local_database/daos/users_dao.dart';
import 'package:trend/data/local_database/daos/vendors_dao.dart';
import 'package:trend/data/local_database/databases/abstract/i_app_local_database.dart';
import 'package:trend/data/local_database/entities/product_entity.dart';
import 'package:trend/data/local_database/entities/search_history_entity.dart';
import 'package:trend/data/local_database/entities/user_entity.dart';
import 'package:trend/data/local_database/entities/vendor_entity.dart';
import 'package:trend/data/local_database/tables/events.dart';
import 'package:trend/data/local_database/tables/products.dart';
import 'package:trend/data/local_database/tables/search_histories.dart';
import 'package:trend/data/local_database/tables/users.dart';
import 'package:trend/data/local_database/tables/vendor_categories_products.dart';
import 'package:trend/data/local_database/tables/vendors.dart';
import 'package:trend/data/models/address_model.dart';
import 'package:drift_flutter/drift_flutter.dart';
import 'package:trend/data/models/event_model.dart';
import 'package:trend/data/models/vendors/vendor_category_product_model.dart';
part 'app_local_database.g.dart';

@DriftDatabase(tables: [
  Users,
  SearchHistories,
  Products,
  Vendors,
  Events,
  VendorCategoriesProducts,
], daos: [
  UsersDao,
  SearchHistoriesDao,
  ProductsDao,
  VendorsDao,
  EventsDao,
])
@Singleton(as: IAppLocalDatabase)
class AppLocalDatabase extends _$AppLocalDatabase implements IAppLocalDatabase {
  AppLocalDatabase() : super(driftDatabase(name: 'app_db'));
  AppLocalDatabase.test():super(NativeDatabase.memory());
  @override
  int get schemaVersion => 8;

  @override
  MigrationStrategy get migration => MigrationStrategy(
          onUpgrade: (final migrator, final from, final to) async {
        await transaction(() async {
          if (from < 3) {
            await migrator.deleteTable(users.actualTableName);
            await migrator.createTable(users);
          }
          if (from < 5) {
            await migrator.createTable(events);
          }
          if (from < 6) {
            await migrator.createTable(vendorCategoriesProducts);
          }
          if(from<7) {
            await migrator.deleteTable('categories');
          }
          if(from<8) {
            await migrator.deleteTable('searchHistories');
            await migrator.createTable(searchHistories);
          }
        });
      });

  @override
  Future<void> clearUserCache() => Future.wait([
        productsDao.deleteUserData(),
        vendors.deleteAll(),
        searchHistories.deleteAll(),
        events.deleteAll(),
      ]);


  @override
  Future<void> deleteAllProductsOfType({required final ProductsCacheType cacheType})=> productsDao.deleteAllProductsOfType(cacheType:cacheType);
  @override
  Future<void> deleteAllSearchHistoriesOfType(
          {required final SearchCacheType cacheType}) =>
      searchHistoriesDao.deleteAllSearchHistoriesOfType(cacheType: cacheType);
  @override
  Future<void> deleteAllVendors() => vendorsDao.deleteAllVendors();
  @override
  Future<void> deleteProduct(
          {required final String id,
          required final ProductsCacheType cacheType}) =>
      productsDao.deleteProduct(id: id, cacheType: cacheType);
  @override
  Future<void> deleteSearchHistory(final SearchHistoryEntity item) =>
      searchHistoriesDao.deleteSearchHistory(item);
  @override
  Future<List<VendorEntity>> getAllVendors() => vendorsDao.getAllVendors();
  @override
  Future<UserEntity?> getCurrentUser() => usersDao.getCurrentUser();
  @override
  Future<List<ProductEntity>> getProductsByType(
          {required final ProductsCacheType cacheType}) =>
      productsDao.getProductsByType(cacheType: cacheType);
  @override
  Future<List<SearchHistoryEntity>> getSearchesByType(
          {required final SearchCacheType cacheType}) =>
      searchHistoriesDao.getSearchesByType(cacheType: cacheType);
  @override
  Future<void> insertProduct(final ProductEntity singleProduct) =>
      productsDao.insertProduct(singleProduct);
  @override
  Future<void> insertSearch(final SearchHistoryEntity singleSearch) =>
      searchHistoriesDao.insertSearch(singleSearch);
  @override
  Future<void> insertSearchVendor(final VendorEntity singleVendor) =>
      vendorsDao.insertSearchVendor(singleVendor);
  @override
  Future<List<VendorCategoryProductModel>> getVendorProducts({required final String vendorId})=>vendorsDao.getVendorProducts(vendorId: vendorId);

  @override
  Future<void> insertVendorProducts({required final String vendorId, required final List<VendorCategoryProductModel> vendorProducts})=>vendorsDao.insertVendorProducts(vendorId: vendorId,
      vendorProducts: vendorProducts);

  @override
  Future<void> setLastLocation(
      {required final double latitude,
      required final double longitude,
      required final String? addressString,
      required final AddressModel? address}) => usersDao.setLastLocation(
        latitude: latitude,
        longitude: longitude,
        addressString: addressString,
        address: address);

  @override
  Future<void> setToken(final String newToken) => usersDao.setToken(newToken);

  @override
  Future<EventModel> getUserEvent({required final String eventId})=>eventsDao.getUserEvent(eventId:eventId);
  @override
  Future<void> upsertUserEvent({required final EventModel event})=>eventsDao.upsertUserEvent(event:event);
  @override
  Future<void> deleteUserEvent({required final String eventId})=>eventsDao.deleteUserEvent(eventId:eventId);
  @override
  Future<List<EventModel>> getUserEvents()=>eventsDao.getUserEvents();
  @override
  Future<void> insertUserEvents({required final List<EventModel> events})=>eventsDao.insertUserEvents(userEvents:events);


}
