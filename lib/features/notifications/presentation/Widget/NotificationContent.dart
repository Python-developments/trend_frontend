import 'package:flutter/material.dart';

import 'package:trend/data/models/core/notification_model.dart';

import 'package:trend/features/notifications/presentation/Widget/ButtonsFollowing.dart';
import 'package:trend/features/notifications/presentation/Widget/actorandtime.dart';
import 'package:trend/features/notifications/presentation/Widget/notificatioVerb.dart';

class Notificationcontent extends StatefulWidget {
  const Notificationcontent({required this.notification, super.key});
  final NotificationModel notification;

  @override
  State<Notificationcontent> createState() => _NotificationcontentState();
}

class _NotificationcontentState extends State<Notificationcontent> {
  @override
  Widget build(final BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Actorandtime(
          Actor: widget.notification.actor,
          createdAt: widget.notification.createdAt,
        ),
        Notificatioverb(
          verb: widget.notification.verb,
        ),
        SizedBox(height: 5),
        if (widget.notification.verb.contains('following you'))
          Row(
            children: [
              Visibility(
                visible: !widget.notification.is_following,
                child: GestureDetector(
                  onTap: () {

                  },
                  child:
                         Buttonsfollowing.buildFollowBackButton()

                ),
              ),
              SizedBox(
                width: 10,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                  height: 34,
                  width: 112,
                  decoration: BoxDecoration(
                    color: Color(0xffF9F9FC),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                  child: Center(
                    child: Text(
                      'Remove',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
      ],
    );
  }
}
