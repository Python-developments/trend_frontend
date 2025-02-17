import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:trend/core/controllers/list_data_loader.dart';

part 'continuously_pagination_list_data_loader.g.dart';

abstract class ContinuouslyPaginationListDataLoader<T>
    extends ContinuouslyPaginationListDataLoaderBase<T>
    with _$ContinuouslyPaginationListDataLoader {
  ContinuouslyPaginationListDataLoader(super.logger,super.appRouter,super.snakeBarShower);
}

abstract class ContinuouslyPaginationListDataLoaderBase<T>
    extends ListDataLoader<T> with Store {
  ContinuouslyPaginationListDataLoaderBase(super.logger,super.appRouter,super.snakeBarShower);
  Future<List<T>> continuouslyPaginationGetter({
    required final int pageNumber,
    required final int chunkPageSize,
    required final int skippedItems,
  });

  @override
  Future<List<T>> listGetter() async => (await continuouslyPaginationGetter(
      pageNumber: 1, chunkPageSize: initialPageSize, skippedItems: 0));

  int chunkPageNumber = 0;
  int get initialPageSize;
  int get chunkSize;

  @observable
  bool canLoadMoreData = true;

  @override
  @action
  Future<void> loadData() => runStorePrimaryFunction(() async {
        await onInit();
        canLoadMoreData = true;
        chunkPageNumber = 0;

        final List<T> paginationData = await continuouslyPaginationGetter(
            pageNumber: 1, chunkPageSize: initialPageSize, skippedItems: 0);
        data = paginationData.asObservable();
        canLoadMoreData = paginationData.isNotEmpty;
        if (data!.isEmpty && emptyError != null) {
          throw emptyError!;
        }

        _loadNextPage();
      });

  @action
  void _loadNextPage() => runStoreSecondaryFunction(() async {
        if (!canLoadMoreData) {
          return;
        }

        final List<T> paginationData = await continuouslyPaginationGetter(
            pageNumber: ++chunkPageNumber,
            chunkPageSize: initialPageSize,
            skippedItems: data!.length);
        data?.addAll(paginationData);
        canLoadMoreData = paginationData.isNotEmpty;
        _loadNextPage();
      });
}
