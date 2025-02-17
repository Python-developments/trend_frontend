import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/models/core/notification_data_model.dart';
import 'package:trend/third_parties_modules/abstract/i_module.dart';

abstract class INotificationsModule extends IModule {
  String? token;
  NotificationDataModel? initialMessage;
  Future<void> init();
  NotificationsProviderType get providerType;
  Future<void> handleNotification(final Map<String, dynamic> notificationData);
  Future<void> deleteToken();
}
