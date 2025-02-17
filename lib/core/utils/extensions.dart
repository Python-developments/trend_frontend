import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/dependencies.dart';
import 'package:trend/third_parties_modules/abstract/i_logger_module.dart';

extension DateTimeUtils on DateTime {
  String get dayFormat => '$day/$month/$year';

  Duration get subtractFromNow => difference(DateTime.now());

  String get timeFormat => DateFormat('h:mm a').format(this);
}

extension AppRouteUtils on AppRouter {
  BuildContext get currentContext=>getAppRouter.navigatorKey.currentContext!;

  Future<void> redirectToRoute(final PageRouteInfo route) =>
      replaceAll([HomeRouteNavigation(), route]);
  Future<void> redirectToRoutes(final List<PageRouteInfo> routes) =>
      replaceAll([HomeRouteNavigation(), ...routes]);

}

extension StringUtils on String {
  String get toPascalCase {
    final List<String> allLetters = split('');
    String ret = '';
    for (int i = 0; i < allLetters.length; i++) {
      if (i == 0) {
        ret += allLetters[0].toUpperCase();
      } else if (allLetters[i][0] == allLetters[i][0].toUpperCase()) {
        ret += ' ${allLetters[i][0]}';
      } else {
        ret += allLetters[i][0];
      }
    }
    return ret;
  }

  String get capitalized {
    final String result = toPascalCase.toLowerCase();

    final List<String> letters = result.split('');
    letters[0] = letters[0].toUpperCase();
    return letters.fold('', (final pre, final current) => '$pre$current');
  }

  void debugPrint() => getIt<ILoggerModule>().debugLog(this);
}


extension BuildContextUtils on BuildContext {
  ClientDeviceType get deviceType {
    final double screenWidth = MediaQuery.of(this).size.width;
    final double screenHeight = MediaQuery.of(this).size.height;

    final double diagonalSize = sqrt(
      (screenWidth * screenWidth) + (screenHeight * screenHeight),
    );

    const double thresholdPhone = 1100.0;
    const double thresholdTablet = 1500.0;

    if (diagonalSize < thresholdPhone) {
      return ClientDeviceType.phone;
    } else if (diagonalSize < thresholdTablet) {
      return ClientDeviceType.tablet;
    } else {
      return ClientDeviceType.largerDevice;
    }
  }
}
