import 'package:mobx/mobx.dart';
import 'package:trend/core/controllers/list_data_loader.dart';
import 'package:trend/data/models/core/pagination_data_model.dart';

part 'pagination_list_data_loader.g.dart';

abstract class PaginationListDataLoader<T>
    extends PaginationListDataLoaderBase<T> with _$PaginationListDataLoader {
  PaginationListDataLoader(super.logger,super.appRouter,super.snakeBarShower);
}

abstract class PaginationListDataLoaderBase<T> extends ListDataLoader<T>
    with Store {
  PaginationListDataLoaderBase(super.logger,super.appRouter,super.snakeBarShower);
  Future<PaginationDataModel<T>> paginationGetter(
      {required final int pageNumber, required final int perPage});

  @override
  Future<List<T>> listGetter() async =>
      (await paginationGetter(pageNumber: 0, perPage: perPage)).items;

  int pageNumber = 0;
  int perPage = 20;

  @observable
  bool isLoadingMoreData = false;

  @observable
  bool canLoadMoreData = true;

  @override
  @action
  Future<void> loadData() => runStorePrimaryFunction(() async {
        await onInit();
        canLoadMoreData = true;
        isLoadingMoreData = false;
        pageNumber = 0;

        final PaginationDataModel<T> paginationData =
            await paginationGetter(pageNumber: ++pageNumber, perPage: perPage);
        data = paginationData.items.asObservable();
        canLoadMoreData = paginationData.totalItems > data!.length;
        if (data!.isEmpty && emptyError != null) {
          throw emptyError!;
        }
      });

  @action
  Future<void> loadNextPage() => runStoreSecondaryFunction(() async {
        if (isLoadingMoreData || !canLoadMoreData) {
          return;
        }
        isLoadingMoreData = true;

        final PaginationDataModel<T> paginationData =
            await paginationGetter(pageNumber: ++pageNumber, perPage: perPage);
        final List<T> newData = paginationData.items;
        data?.addAll(newData);
        canLoadMoreData = paginationData.totalItems > data!.length;
        isLoadingMoreData = false;
      }, onCatchError: (final e) {
        isLoadingMoreData = false;
      });
}
