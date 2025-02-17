import 'package:drift/drift.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/local_database/databases/concrete/app_local_database.dart';
import 'package:trend/data/local_database/entities/product_entity.dart';
import 'package:trend/data/local_database/tables/products.dart';

part 'products_dao.g.dart';

@DriftAccessor(tables: [Products])
class ProductsDao extends DatabaseAccessor<AppLocalDatabase>
    with _$ProductsDaoMixin {
  ProductsDao(super.attachedDatabase);

  Future<void> insertProduct(final ProductEntity singleProduct) async {
    const int productsSavingLimit = 10;
    final List<ProductEntity> currentProducts =
        await getProductsByType(cacheType: singleProduct.productCacheType);
    if (currentProducts.any((final element) =>
        element.productCacheType == singleProduct.productCacheType &&
        element.id == singleProduct.id)) {
      return;
    }

    if (currentProducts.length >= productsSavingLimit) {
      await deleteProduct(
          id: currentProducts.last.id,
          cacheType: singleProduct.productCacheType);
    }
    await into(products).insert(singleProduct.toLocalProduct());
    return;
  }

  Future<List<ProductEntity>> getProductsByType(
      {required final ProductsCacheType cacheType}) async {
    final List<Product> result = await ((select(products)
          ..where(
              (final entity) => entity.productCacheType.equals(cacheType.name)))
        .get());

    return result
        .map((final localProduct) =>
            ProductEntity.fromLocalProduct(localProduct))
        .toList();
  }

  Future<void> deleteProduct(
          {required final String id,
          required final ProductsCacheType cacheType}) =>
      (delete(products)
            ..where((final tbl) =>
                tbl.id.equals(id) &
                tbl.productCacheType.equals(cacheType.name)))
          .go();

  Future<void> deleteAllProductsOfType({required final ProductsCacheType cacheType})=>products.deleteWhere((final p)=>p.productCacheType.equalsValue(cacheType));

  Future<void> deleteUserData()=>Future.wait([
    deleteAllProductsOfType(cacheType: ProductsCacheType.favorites),
    deleteAllProductsOfType(cacheType: ProductsCacheType.search),
  ]);
}
