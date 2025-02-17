


import 'package:trend/data/models/orders/order_live_activity_model.dart';

abstract class ILiveActivitiesShowerModule{
  Future<void> showOrder({required final OrderLiveActivityModel orderLiveActivity});
  Future<void> cancelNotifications();
}