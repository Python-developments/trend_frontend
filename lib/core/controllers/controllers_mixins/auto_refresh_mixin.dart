import 'dart:async';

import 'package:trend/core/controllers/base_controller.dart';

mixin AutoRefreshMixin on BaseController {
  Duration get refreshRate;
  Future<void> refreshingFunction();
  Timer? _refreshTimer;

  void initTimer() {
    _refreshTimer = Timer.periodic(refreshRate, (final timer) {
      refreshData();
    });
  }

  void refreshData() => runStoreSecondaryFunction(refreshingFunction);

  void cancelTimer() => _refreshTimer?.cancel();

  @override
  void dispose() {
    cancelTimer();
  }
}
