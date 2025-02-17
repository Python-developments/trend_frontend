import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:trend/core/controllers/list_data_loader.dart';
import 'package:trend/data/errors/core_errors.dart';
import 'package:trend/data/errors/custom_error.dart';


abstract class CachedListDataLoader<T> extends ListDataLoader<T>{
  CachedListDataLoader(super.logger, super.appRouter, super.snakeBarShower);


  Future<List<T>>cachedListGetter();
  Future<void> cacheList(final List<T> onlineResult);


  @override
  @action
  Future<void> loadData() => runStorePrimaryFunction(() async {
    await onInit();
    data=(await cachedListGetter()).asObservable();
    isLoading=data?.isEmpty??true;
    final List<T> result = await dataGetter();
    data = result.asObservable();
    unawaited(cacheList(result));

    if (data!.isEmpty && emptyError != null) {
      throw emptyError!;
    }
    isLoading=false;

  },onCatchError: (final e){
  error=e is CustomError ? e : SomethingWentWrongError() ;
  isLoading=false;
  });
}