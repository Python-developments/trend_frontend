import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:logger/logger.dart';
import 'package:trend/core/utils/flavors.dart';
import 'package:trend/third_parties_modules/abstract/i_logger_module.dart';

@Singleton(as: ILoggerModule)
class LoggerModule extends ILoggerModule {
  final Flavor appFlavor;
  final Logger logger = Logger(printer: SimplePrinter());

  LoggerModule(this.appFlavor);

  @override
  Future<void> init() async {
    if (!appFlavor.showErrors) {
      /*FlutterError.onError = (final details) {
        FirebaseCrashlytics.instance.recordFlutterFatalError(details);
      };

      PlatformDispatcher.instance.onError = (final error, final stackTrace) {
        FirebaseCrashlytics.instance.recordError(error, stackTrace);
        return true;
      };*/
    }
  }

  @override
  void logCritical(
      {required final Object exception,
      required final StackTrace stackTrace})  {
    if (!appFlavor.showErrors) {
       /*FirebaseCrashlytics.instance.recordError(
        exception,
        stackTrace,
      );*/
    } else {
      logger.w('Wiso error log $exception $stackTrace');
    }
  }

  @override
  Future<void> logEvent(final Future<void> Function() eventCallback) async {
    if (!appFlavor.showErrors) {
      await eventCallback();
    }
  }

  @override
  void debugLog(final String content) {
    logger.d('Wiso $content');
  }
}
