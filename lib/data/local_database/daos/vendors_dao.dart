import 'package:drift/drift.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/local_database/databases/concrete/app_local_database.dart';
import 'package:trend/data/local_database/daos/i_crud_dao.dart';
import 'package:trend/data/local_database/entities/product_entity.dart';
import 'package:trend/data/local_database/entities/vendor_entity.dart';
import 'package:trend/data/local_database/tables/base_cache_table.dart';
import 'package:trend/data/local_database/tables/products.dart';
import 'package:trend/data/local_database/tables/vendor_categories_products.dart';
import 'package:trend/data/local_database/tables/vendors.dart';
import 'package:trend/data/models/vendors/vendor_category_product_model.dart';

part 'vendors_dao.g.dart';

@DriftAccessor(tables: [Vendors,VendorCategoriesProducts,Products])
class VendorsDao extends ICrudDao<Vendor> with _$VendorsDaoMixin {
  VendorsDao(super.attachedDatabase);

  @override
  TableInfo<BaseCacheTable, Vendor> get table => vendors;

  @override
  String entityIdGetter(final Vendor entity) => entity.id;

  Future<void> insertSearchVendor(final VendorEntity singleVendor) async {
    const int vendorsSavingLimit = 10;

    if (await getEntityById(singleVendor.id) != null) {
      return;
    }

    final List<Vendor> currentVendors = await getAllEntities();

    if (currentVendors.length >= vendorsSavingLimit) {
      await deleteEntity(currentVendors.last.id);
    }
    await into(attachedDatabase.vendors).insert(singleVendor.toLocalVendor());
    return;
  }

  Future<List<VendorEntity>> getAllVendors() async =>
      (await getAllEntities()).map(VendorEntity.fromLocalVendor).toList();

  Future<void> deleteAllVendors() => deleteAllEntities();

  Future<List<VendorCategoryProductModel>> getVendorProducts({required  final String vendorId})async{

    final query = (select(vendorCategoriesProducts)..where(
            (final v)=>v.vendorId.equals(vendorId))
        ).join([
      innerJoin(products, products.id.equalsExp(vendorCategoriesProducts.productId)),
    ]);


    return (await query.get()).map((final rows) => VendorCategoryProductModel(
          categoryId:rows.readTable(vendorCategoriesProducts).categoryId,
          product:ProductEntity.fromLocalProduct( rows.readTable(products)).toProductModel(),
        )).toList();
  }

  Future<void>insertVendorProducts({required final String vendorId,required final List<VendorCategoryProductModel> vendorProducts})async{
    await Future.wait(vendorProducts.map((final vendorProduct)=> products.deleteWhere(
            (final p)=>p.id.equals(vendorProduct.product.id)  & p.productCacheType.equalsValue(ProductsCacheType.vendorListing
            ))));

        await products.insertAll(vendorProducts.map((final categoryProduct)=>ProductEntity.fromProductModel(categoryProduct.product,
        ProductsCacheType.vendorListing).toLocalProduct()));

    await vendorCategoriesProducts.deleteWhere((final v)=>v.vendorId.equals(vendorId));
    await vendorCategoriesProducts.insertAll(vendorProducts.map((final categoryProduct)=>VendorCategoriesProduct(vendorId: vendorId,
        categoryId: categoryProduct.categoryId, productId: categoryProduct.product.id)));

  }
}
