import 'package:flutter/material.dart';


import 'package:flutter_screenutil/flutter_screenutil.dart';import 'package:trend/data/models/core/notification_model.dart';

import 'package:trend/features/notifications/presentation/Widget/Get_Icon_For_Notification.dart';
import 'package:trend/features/posts/presentation/widgets/Networkimage.dart';

class NotificationAvatar extends StatelessWidget {
  const NotificationAvatar({super.key, required this.notification});
  final NotificationModel notification;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white,
          child: GestureDetector(
            onTap: () {},
            child: ClipOval(
              child: Networkimages(
                imageUrl: notification.avatar,
                size: 50.r,
              ),
            ),
          ),
        ),
        Positioned(
            top: 23, left: 25, child: GetIconForNotification(notification.verb))
      ],
    );
  }
}
