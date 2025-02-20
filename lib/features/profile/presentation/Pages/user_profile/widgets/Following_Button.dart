import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/data/models/auth/user_profile_model.dart';

class FollowingButton extends StatelessWidget {
  const FollowingButton({required this.user, super.key});
  final UserProfileModel user;
  @override
  Widget build(final BuildContext context) {
          return ElevatedButton(
              onPressed: () async {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromARGB(255, 0, 0, 0),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7.r),
                ),
              ),
              child: Text(
                      'Follow',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 12.sp,
                          fontWeight: FontWeight.bold),
                    ));
  }
}
