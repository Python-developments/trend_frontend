import 'package:drift/drift.dart';

class BaseCacheTable extends Table {
  IntColumn get id => integer().unique()();
}
