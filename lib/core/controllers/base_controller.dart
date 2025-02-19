import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/core/presentation/snake_bars/bottom_snack_bar.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/errors/core_errors.dart';
import 'package:trend/data/errors/custom_error.dart';
import 'package:trend/third_parties_modules/abstract/i_logger_module.dart';

part 'base_controller.g.dart';

class BaseController extends BaseControllerBase with _$BaseController {
  BaseController(super.logger, super.appRouter, super.snakeBarShower);
}

abstract class BaseControllerBase with Store {
  final ILoggerModule logger;
  final AppRouter appRouter;
  final SnakeBarShower snakeBarShower;
  bool get isLazyController => false;

  BaseControllerBase(this.logger,this.appRouter,this.snakeBarShower){
    if (!isLazyController) {
      loadData();
    }
  }

  @observable
  CustomError? error;

  @observable
  bool isLoading = false;

  @computed
  bool get hasData => error == null && !isLoading;

  @action
  Future<void> onInit() async {}

  void loadData() {}

  (String, void Function())? get errorButton {
    return error is UnAuthorizedError
        ? (
            'Login / Register',
            () => appRouter
                .push(LoginRoute())
          )
        : (error is ServerError || error is InternetConnectionError || error is SomethingWentWrongError)
            ? ('Try again', loadData)
            : null;
  }

  @action
  void dispose() {}

  @action
  Future<bool> runStorePrimaryFunction(final Future<void> Function() function,
      {final void Function(Object)? onCatchError}) async {
    try {
      if (isLoading) {
        return false;
      }

      isLoading = true;
      error = null;
      await function();
      isLoading = false;
      return true;
    } on CustomError catch (e, stackTrace) {
      if (onCatchError != null) {
        onCatchError(e);
      }
      if (e is ServerError) {
         logger.logCritical(exception: e, stackTrace: stackTrace);
      }
      error = e;

      isLoading = false;
      return false;
    } on Exception catch (e, stackTrace) {
      if (onCatchError != null) {
        onCatchError(e);
      }
      error = ServerError();

      logger.logCritical(exception: e, stackTrace: stackTrace);

      isLoading = false;
      return false;
    }
  }

  @action
  Future<bool> runStoreSecondaryFunction(final Future<void> Function() function,
      {final void Function(Object)? onCatchError}) async {
    try {
      await function();
      return true;
    } on CustomError catch (e, stackTrace) {
      if (onCatchError != null) {
        onCatchError(e);
      }
      snakeBarShower.showSnakeBar(e.errorMessage, ToastType.error);
      if (e is ServerError) {
         logger.logCritical(exception: e, stackTrace: stackTrace);
      }
      return false;
    } on Exception catch (e, stackTrace) {
      if (onCatchError != null) {
        onCatchError(e);
      }
       logger.logCritical(exception: e, stackTrace: stackTrace);
      return false;
    }
  }
}
