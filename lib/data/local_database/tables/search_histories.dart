import 'package:drift/drift.dart';
import 'package:trend/core/utils/enums.dart';

class SearchHistories extends Table {
  TextColumn get content => text()();
  TextColumn get searchCacheType => textEnum<SearchCacheType>()();

  @override
  Set<Column<Object>>? get primaryKey => {content,searchCacheType};
}
