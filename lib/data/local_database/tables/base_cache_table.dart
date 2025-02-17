import 'package:drift/drift.dart';

class BaseCacheTable extends Table {
  TextColumn get id => text().unique()();
}
