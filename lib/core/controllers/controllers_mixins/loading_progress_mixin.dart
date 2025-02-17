import 'package:mobx/mobx.dart';
import 'package:trend/core/controllers/base_controller.dart';

mixin LoadingProgressMixin on BaseController {
  @observable
  double loadingPercent = 0;

  @action
  void changeLoadingPercent(final double newLoadingPercent) =>
      loadingPercent = newLoadingPercent;
}
