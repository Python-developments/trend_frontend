import 'package:flutter/material.dart';
import 'package:trend/core/presentation/widgets/custom_animated_list_data_loader_widget.dart';
import 'package:trend/dependencies.dart';
import 'package:trend/features/notifications/controllers/notifications_controller.dart';
import 'package:trend/features/notifications/presentation/Widget/Notificatioitem.dart';

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  List<bool> isFollowing = []; // حالة زر المتابعة لكل إشعار

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        scrolledUnderElevation: 0,
        centerTitle: true,
        title: const Text(
          'NotificationsPage',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w400,
            color: Color(0xff000000),
          ),
        ),
      ),
      body: CustomAnimatedListDataLoaderWidget(dataLoader: getIt<NotificationsController>(),
          dataToWidgetMapper: (final notification)=>NotificationItem(notification: notification),
    ));
  }
}
