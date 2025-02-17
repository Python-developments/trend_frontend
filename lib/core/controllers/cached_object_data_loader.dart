import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:trend/core/controllers/object_data_loader.dart';
import 'package:trend/data/errors/core_errors.dart';
import 'package:trend/data/errors/custom_error.dart';


abstract class CachedObjectDataLoader<T> extends ObjectDataLoader<T>{

  CachedObjectDataLoader(super.logger,super.appRouter,super.snakeBarShower);

  Future<T?>cachedObjectGetter();
  Future<void>cacheObject(final T onlineResult);



  @override
  @action
  Future<void> loadData() => runStorePrimaryFunction(() async {
    await onInit();
    data=await cachedObjectGetter();
    isLoading= data==null;
    data = await dataGetter();
    unawaited(cacheObject(data as T));
    isLoading=false;
  },onCatchError: (final e){
    error=e is CustomError ? e : SomethingWentWrongError() ;
    isLoading=false;
  });
}