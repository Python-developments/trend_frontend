import 'package:flutter/material.dart';
import 'package:trend/core/controllers/base_controller.dart';
import 'package:trend/dependencies.dart';
import 'package:trend/third_parties_modules/abstract/i_module.dart';

mixin StateControllerCreatorMixin<T extends BaseController,
    F extends StatefulWidget> on State<F> {
  T createdController = getIt<T>();

  @override
  void dispose() {
    createdController.dispose();
    super.dispose();
  }
}

mixin WidgetControllerCreatorMixin<T extends BaseController> on Widget {
  final T createdController = getIt<T>();
}

mixin WidgetModuleCreatorMixin<T extends IModule> on Widget {
  final T createdModule = getIt<T>();
}

mixin OnChangeDependenciesMixin<F extends StatefulWidget> on State<F> {
  bool isFirstDependency = true;
  void onChangeDependencies() {}
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (!isFirstDependency) {
      return;
    }
    isFirstDependency = false;
    onChangeDependencies();
  }
}
