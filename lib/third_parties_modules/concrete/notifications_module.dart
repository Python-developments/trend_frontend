import 'dart:async';
import 'dart:math';
import 'dart:developer' as dev;
import 'package:google_huawei_availability/google_huawei_availability.dart';
import 'package:huawei_push/huawei_push.dart' as hp;
import 'dart:convert';
import 'dart:io';
import 'package:injectable/injectable.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart' as fb;
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:trend/core/presentation/arguments/event_details_page_arguments.dart';
import 'package:trend/core/presentation/arguments/product_details_page_arguments.dart';
import 'package:trend/core/presentation/arguments/vendor_products_page_arguments.dart';
import 'package:trend/core/presentation/assets.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/core/presentation/sheets/show_rate_order_bottom_sheet.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/core/utils/extensions.dart';
import 'package:trend/data/models/core/notification_data_model.dart';
import 'package:trend/data/models/orders/order_live_activity_model.dart';
import 'package:trend/firebase_options.dart';
import 'package:trend/third_parties_modules/abstract/i_live_activities_shower_module.dart';
import 'package:trend/third_parties_modules/abstract/i_logger_module.dart';
import 'package:trend/third_parties_modules/abstract/i_notifications_module.dart';

//must be string string all the time
typedef PushNotificationMessageModel = (String title, String body, Map<String, String> data);

@pragma('vm:entry-point')
Future<void> remoteBackgroundHandler(final fb.RemoteMessage message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

@pragma('vm:entry-point')
Future<void> notificationBackgroundHandler(final NotificationResponse message) async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
}

Future<void> huaweiShowNotificationCallback(final hp.RemoteMessage remoteMessage) async {
  await hp.Push.localNotification({
    hp.HMSLocalNotificationAttr.TITLE: remoteMessage.dataOfMap?['title'],
    hp.HMSLocalNotificationAttr.MESSAGE: remoteMessage.dataOfMap?['body'],
    hp.HMSLocalNotificationAttr.DATA: remoteMessage.dataOfMap,
    hp.HMSLocalNotificationAttr.SMALL_ICON: '@mipmap/launcher_icon',
  });
}

@Singleton(as: INotificationsModule)
class NotificationsModule extends INotificationsModule {
  final ILoggerModule logger;
  final ILiveActivitiesShowerModule liveActivitiesShowerModule;
  final AppRouter appRouter;

  FlutterLocalNotificationsPlugin? _flutterLocalNotificationsPlugin;
  bool isHuaweiDevice = false;
  final String _huaweiNotificationsScope = 'huaweiNotifications';

  NotificationsModule(this.liveActivitiesShowerModule,this.logger, this.appRouter);

  @override
  Future<void> init() async {
    try {
      isHuaweiDevice = await GoogleHuaweiAvailability.isHuaweiServiceAvailable ?? false;
    } catch (_) {}
    isHuaweiDevice ? await _initHuaweiNotifications() : await _initFirebaseNotifications();
  }

  @override
  Future<void> deleteToken() async {
    try {
      isHuaweiDevice ? await hp.Push.deleteToken(_huaweiNotificationsScope) : await fb.FirebaseMessaging.instance.deleteToken();
    } catch (_) {}
  }

  Future<void> _initFirebaseNotifications() async {
    try {
      token = await fb.FirebaseMessaging.instance.getToken();
      await _getNotification();

      await fb.FirebaseMessaging.instance.requestPermission(
        alert: true,
        announcement: false,
        badge: true,
        carPlay: false,
        criticalAlert: false,
        provisional: false,
        sound: true,
      );
      await fb.FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
        alert: true,
        badge: true,
        sound: true,
      );
      final fb.RemoteMessage? initialNotification = await fb.FirebaseMessaging.instance.getInitialMessage();
      if (initialNotification != null) {
        initialMessage = NotificationDataModel.fromJson(initialNotification.data);
      }

      fb.FirebaseMessaging.onMessageOpenedApp.listen((final message) {
        handleNotification(message.data);
      });

      fb.FirebaseMessaging.onMessage.listen((final message) {
        Map<String, String> convertedNotificationMap = {};
        try {
          convertedNotificationMap = Map.fromEntries(message.data.entries.map((final entry) => MapEntry(entry.key, entry.value as String)));
        } catch (_) {
          return;
        }
        _onMessageReceived(convertedNotificationMap);
        if (Platform.isAndroid) {
          /// IOS APNS SOUND DEFAULT
          _showNotification((
            message.data['title'] ?? message.notification?.title,
            message.data['body'] ?? message.notification?.body,
            convertedNotificationMap
          ));
        }
      });
      fb.FirebaseMessaging.onBackgroundMessage(remoteBackgroundHandler);
        logger.debugLog('token $token');
    } catch (e,stackTrace) {
  logger.logCritical(exception: e, stackTrace: stackTrace);
}
  }

  Future<void> _initHuaweiNotifications() async {
    await hp.Push.turnOnPush();
    hp.Push.getTokenStream.listen((final value) => token = value);
    hp.Push.getToken(_huaweiNotificationsScope);

    final dynamic initialNotification = await hp.Push.getInitialNotification();

    if (initialNotification != null) {
      try {
        final Map<Object?, Object?> data = initialNotification['extras'];
        final Map<String, dynamic> convertedMap = {};
        data.forEach((final key, final value) {
          if (key is String) {
            convertedMap[key] = value;
          }
        });
        initialMessage = NotificationDataModel.fromJson(convertedMap);
      } catch (e) {}
    }

    await hp.Push.registerBackgroundMessageHandler(huaweiShowNotificationCallback);
    hp.Push.onMessageReceivedStream.listen((final hp.RemoteMessage message) {
      _onMessageReceived(message.dataOfMap ?? {});
      huaweiShowNotificationCallback(message);
    });
    hp.Push.onNotificationOpenedApp.listen((final message) {
      try {
        handleNotification(message['extras']);
      } catch (_) {}
    });
  }

  Future<FlutterLocalNotificationsPlugin> _getNotification() async {
    if (_flutterLocalNotificationsPlugin != null) {
      return _flutterLocalNotificationsPlugin!;
    } else {
      const AndroidInitializationSettings initializationSettingsAndroid = AndroidInitializationSettings('@mipmap/launcher_icon');

      const DarwinInitializationSettings initializationSettingsDarwin = DarwinInitializationSettings(
        requestAlertPermission: true,
        requestBadgePermission: true,
        requestSoundPermission: true,
      );

      const InitializationSettings initializationSettings = InitializationSettings(
        android: initializationSettingsAndroid,
        iOS: initializationSettingsDarwin,
      );

      _flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
      await _flutterLocalNotificationsPlugin!.initialize(
        initializationSettings,
        onDidReceiveNotificationResponse: (final response) {
          try {
            handleNotification(json.decode(convertToJsonString(response.payload ?? '{}')));
          } catch (e,stackTrace) {
            logger.logCritical(exception: e, stackTrace: stackTrace);
          }
        },
        onDidReceiveBackgroundNotificationResponse: notificationBackgroundHandler,
      );
      return _flutterLocalNotificationsPlugin!;
    }
  }

  Future<void> _showNotification(final PushNotificationMessageModel message) async {
    final FlutterLocalNotificationsPlugin noti = await _getNotification();

    final AndroidNotificationChannel channel =
        AndroidNotificationChannel(Random.secure().nextInt(100000).toString(), 'wow_vir', importance: Importance.max);

    final AndroidNotificationDetails androidPlatformChannelSpecifics = AndroidNotificationDetails(channel.id.toString(), channel.name,
        channelDescription: 'wow_vir channel', importance: Importance.max, priority: Priority.high, ticker: 'ticker');

    const DarwinNotificationDetails iosNotificationDetails =
        DarwinNotificationDetails(presentAlert: true, presentBadge: true, presentSound: true);
    final NotificationDetails platformChannelSpecifics = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: iosNotificationDetails,
    );

    await noti.show(1, message.$1, message.$2, platformChannelSpecifics, payload: message.$3.toString());
  }

  @override
  Future<void> handleNotification(final Map<String, dynamic> notificationData) async {
    logger.debugLog('handeling $notificationData');
    final NotificationDataModel notificationDataModel = NotificationDataModel.fromJson(notificationData);
    await notificationDataModel.map(
        product: (final notification) async => await appRouter.redirectToRoute(ProductDetailsRoute(
            args: ProductDetailsPageArguments(
                productId: notification.productId, defaultImage: null, productsPageRefresher: null, initialItemIndex: 0))),
        vendor: (final notification) async => await appRouter.redirectToRoute(VendorProductsRoute(
                args: VendorDetailsPageArguments(
              vendorId: notification.vendorId,
            ))),
        order: (final notification) async {
          await appRouter.redirectToRoute(OrderDetailsRoute(orderId: notification.orderId));
        },
        event: (final notification) async => await appRouter
            .redirectToRoute(EventDetailsRoute(args: EventDetailsPageArguments(eventId: notification.eventId, eventPageRefresher: null))),
        cart: (final _) async => await appRouter.push(HomeRouteNavigation(initialTile: HomeNavigationBarTileType.cart)));
  }

  void _onMessageReceived(final Map<String, String> messageData) {
    try{
      final NotificationDataModel notificationData = NotificationDataModel.fromJson(messageData);
      notificationData.mapOrNull(order: (final notification) {
        if (Platform.isIOS) {
          if ([OrderNotificationType.orderCanceled, OrderNotificationType.orderCompleted].contains(notification.notificationType)) {
            liveActivitiesShowerModule.cancelNotifications();
          } else if ([OrderNotificationType.orderPlaced, OrderNotificationType.orderPreparing, OrderNotificationType.orderOutForDelivery]
              .contains(notification.notificationType)) {
            liveActivitiesShowerModule.showOrder(
                orderLiveActivity: OrderLiveActivityModel(
                    orderId: notification.orderId,
                    orderStatus: notification.orderStatus,
                    orderDeliveryBy: notification.orderDeliveryBy,
                    estimatedDeliveryTime: notification.estimatedDeliveryTime,
                    orderType: notification.orderType,
                    vendorName: notification.vendorName,
                    orderNumber: notification.orderNumber,
                    categoryExtension: notification.categoryExtension,

                    imagePath: Assets.deliveryCar));
          }
        }
        else if (notification.notificationType == OrderNotificationType.orderCompleted) {
          showRateOrderBottomSheet(orderId: notification.orderId, pageRefresher: null);
        }
      });
    }
    catch(e){
      dev.log(e.toString());
    }

  }

  @override
  NotificationsProviderType get providerType => isHuaweiDevice ? NotificationsProviderType.huawei : NotificationsProviderType.firebase;

  String convertToJsonString(final String inputString) {
    final List<String> keyValuePairs = inputString.split(',');

    final List<String> convertedPairs = [];
    for (String pair in keyValuePairs) {
      final List<String> keyValue = pair.trim().split(':');
      final String key = keyValue[0];
      String value = keyValue[1].trim();

      value = '"$value"';

      convertedPairs.add('$key:$value');
    }

    return convertedPairs.join(',');
  }
}
