import 'dart:math';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:trend/core/controllers/localization_controller.dart';
import 'package:trend/core/presentation/arguments/address_details_page_arguments.dart';
import 'package:trend/core/presentation/arguments/map_location_selection_page_arguments.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/models/cart/cart_item_model.dart';
import 'package:trend/data/models/core/location_model.dart';
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
  void addNewAddress(
          {required final void Function() pageRefresher,
          required final LocationModel initialLocation}) =>
      push(MapLocationSelectionRoute(
          args: MapLocationSelectionPageArguments(
              title: 'Select the location',
              initialValue: initialLocation,
              onSubmitLocation: (final location, final addressString) =>
                  getAppRouter.push(AddressDetailsRoute(
                      args: AddressDetailsPageArguments(
                          address: null,
                          addressPageRefresher: pageRefresher,
                          initialLocation: location,
                          addressString: addressString))))));
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

  String get translateWord => getIt<LocalizationController>().translate(this);

  String translateWordWithArguments({required final List<String> arguments}) =>
      getIt<LocalizationController>().translate(this, arguments);
  void debugPrint() => getIt<ILoggerModule>().debugLog(this);
}

extension NumberUtils on num {
  String get currency {
    final String thousandFormat =
        NumberFormat.decimalPattern('en').format(this);
    return '${"AED".translateWord} $thousandFormat';
  }
}

extension CartListUtils on List<CartItemModel> {
  double get totalCost => fold(
      0,
      (final previousValue, final element) =>
          previousValue + element.totalPrice);

  int get totalItems =>fold(
  0, (final prev, final current) => prev + current.quantity);
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
