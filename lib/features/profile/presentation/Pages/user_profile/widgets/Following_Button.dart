import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/data/models/auth/user_profile_model.dart';
import 'package:trend/features/profile/presentation/Manager/Bloc_Following/State_Following.dart';
import 'package:trend/features/profile/presentation/Manager/Bloc_Following/bloc_folllowing.dart';
import 'package:trend/features/profile/presentation/Manager/Bloc_Following/event_Following.dart';
import 'package:trend/features/profile/presentation/Manager/Bloc_get_User/bloc_get.dart';
import 'package:trend/features/profile/presentation/Manager/Bloc_get_User/event_getU.dart';

class FollowingButton extends StatelessWidget {
  const FollowingButton({super.key, required this.user});
  final UserProfileModel user;
  @override
  Widget build(BuildContext context) {
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
