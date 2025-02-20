import 'package:flutter/material.dart';
import 'package:trend/data/models/core/notification_model.dart';

import 'package:trend/features/notifications/presentation/Widget/Avatar.dart';
import 'package:trend/features/notifications/presentation/Widget/NotificationContent.dart';

class NotificationItem extends StatelessWidget {
  final NotificationModel notification;
  const NotificationItem({required this.notification, super.key});

  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          NotificationAvatar(
            notification: notification,
          ),
          SizedBox(width: 10),
          Notificationcontent(
            notification: notification,
          )
        ],
      ),
    );
  }
}
