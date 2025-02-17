import 'package:drift/drift.dart';
import 'package:trend/core/utils/enums.dart';

class Products extends Table {
  TextColumn get id => text()();
  TextColumn get name => text()();
  TextColumn get imageUrl => text().nullable()();
  RealColumn get originalPrice => real()();
  RealColumn get discountPrice => real().nullable()();
  TextColumn get subtitle => text().nullable()();
  TextColumn get productCacheType => textEnum<ProductsCacheType>()();

}
