import 'package:mobx/mobx.dart';
import 'package:trend/core/controllers/base_controller.dart';

part 'object_data_loader.g.dart';

abstract class ObjectDataLoader<T> extends ObjectDataLoaderBase<T>
    with _$ObjectDataLoader {
  ObjectDataLoader(
    super.logger,super.appRouter,super.snakeBarShower
  );
}

abstract class ObjectDataLoaderBase<T> extends BaseController with Store {
  Future<T> dataGetter();

  ObjectDataLoaderBase(super.logger,super.appRouter,super.snakeBarShower);

  @observable
  T? data;

  @override
  @action
  Future<void> loadData() => runStorePrimaryFunction(() async {
        await onInit();
        data = await dataGetter();
      });
}
