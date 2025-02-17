import 'package:drift/drift.dart';
import 'package:trend/data/local_database/tables/base_cache_table.dart';

class Vendors extends BaseCacheTable {
  TextColumn get name => text()();
  TextColumn get logoUrl => text().nullable()();
  TextColumn get coverUrl => text().nullable()();
  IntColumn get reviewsCount => integer()();
  TextColumn get orderEstimationTime => text()();
  RealColumn get rate => real()();
  RealColumn get minimumOrderAmount => real()();
}
