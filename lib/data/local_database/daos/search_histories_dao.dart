import 'package:drift/drift.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/local_database/databases/concrete/app_local_database.dart';
import 'package:trend/data/local_database/entities/search_history_entity.dart';
import 'package:trend/data/local_database/tables/search_histories.dart';
part 'search_histories_dao.g.dart';

@DriftAccessor(tables: [SearchHistories])
class SearchHistoriesDao extends DatabaseAccessor<AppLocalDatabase>
    with _$SearchHistoriesDaoMixin {
  SearchHistoriesDao(super.attachedDatabase);

  Future<void> insertSearch(final SearchHistoryEntity singleSearch) async {
    
    const int typeSavingLimit = 3;

    final List<SearchHistoryEntity> currentSearches =
        await getSearchesByType(cacheType: singleSearch.searchCacheType);

    if (currentSearches.any((final search) =>
        search.content == singleSearch.content &&
        search.searchCacheType == singleSearch.searchCacheType)) {
      return;
    }

    if (currentSearches.length >= typeSavingLimit) {
      await deleteSearchHistory(currentSearches.first);
    }
    await into(searchHistories).insert(singleSearch.toLocalSearchHistory());
    return;
  }

  Future<List<SearchHistoryEntity>> getSearchesByType(
      {required final SearchCacheType cacheType}) async {
    final List<SearchHistory> result = await (select(searchHistories)
          ..where(
              (final entity) => entity.searchCacheType.equals(cacheType.name)))
        .get();
    return result
        .map((final element) =>
            SearchHistoryEntity.fromLocalSearchHistory(element))
        .toList();
  }

  Future<void> deleteSearchHistory(final SearchHistoryEntity item) =>
      (delete(searchHistories)..delete(item.toLocalSearchHistory())).go();

  Future<void> deleteAllSearchHistoriesOfType(
          {required final SearchCacheType cacheType}) =>
      searchHistories.deleteWhere(
          (final tbl) => tbl.searchCacheType.equals(cacheType.name));
}
