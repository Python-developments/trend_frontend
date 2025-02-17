

import 'package:drift/drift.dart';
import 'package:trend/data/local_database/tables/base_cache_table.dart';

class Events extends BaseCacheTable{
  TextColumn get name => text()();
  TextColumn get description => text().nullable()();
  TextColumn get imagePath => text().nullable()();
  DateTimeColumn get date=>dateTime()();
  BlobColumn get reminders=>blob()();
}