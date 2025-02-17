import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/local_database/databases/concrete/app_local_database.dart';


class SearchHistoryEntity {
  final String content;
  final SearchCacheType searchCacheType;
  SearchHistoryEntity({required this.content, required this.searchCacheType});

  factory SearchHistoryEntity.fromLocalSearchHistory(
          final SearchHistory searchHistory) =>
      SearchHistoryEntity(
          content: searchHistory.content,
          searchCacheType: searchHistory.searchCacheType);

  SearchHistory toLocalSearchHistory() =>
      SearchHistory(content: content, searchCacheType: searchCacheType);
}
