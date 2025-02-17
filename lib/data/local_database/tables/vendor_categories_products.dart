


import 'package:drift/drift.dart';
import 'package:trend/data/local_database/tables/products.dart';

class VendorCategoriesProducts extends Table{
  TextColumn get vendorId => text()();
  TextColumn get categoryId => text()();
  TextColumn get productId => text().references(Products, #id)();

}