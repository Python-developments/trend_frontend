import 'package:flutter/material.dart';

import 'package:trend/data/models/core/notification_model.dart';


class Followinfandremove extends StatelessWidget {
  const Followinfandremove({required this.notification, super.key, this.onTap});
  final void Function()? onTap;
  final NotificationModel notification;
  @override
  Widget build(final BuildContext context) {
    return Row(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Container(
              height: 34,
              width: 112,
              decoration: BoxDecoration(
                  color: Color(0xff000000),
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Center(
                child: Text(
                  'Follow Back',
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                      fontWeight: FontWeight.w400),
                ),
              ),
            ),
        ),
        SizedBox(
          width: 5,
        ),
        GestureDetector(
          onTap: () {},
          child: Container(
            height: 34,
            width: 103,
            decoration: BoxDecoration(
                color: Color(0xffF9F9FC),
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Center(
              child: Text(
                'Remove',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                    fontWeight: FontWeight.w400),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
