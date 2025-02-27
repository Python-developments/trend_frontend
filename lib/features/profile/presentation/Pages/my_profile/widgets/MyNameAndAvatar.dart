import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/features/profile/data/models/currentUser.dart';

class Mynameandavatar extends StatelessWidget {
  const Mynameandavatar({super.key, required this.onLongPress, required this.user, required this.onTap});
  final void Function()? onLongPress;
  final currentUser user;
  final void Function() onTap;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
            onTap: onTap,
            onLongPress: onLongPress,
            child: ClipOval(
              child: CachedNetworkImage(
                imageUrl: user.avatar,
                fit: BoxFit.cover,
                errorWidget: (_, __, ___) => Image.asset('assets/images/avatar.jpg'),
                placeholder: (
                  _,
                  __,
                ) =>
                    Image.asset('assets/images/avatar.jpg'),
                height: 100.r,
                width: 100.r,
              ),
            )),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the text horizontally
          children: [
            Text(
              user.fullName != "" ? user.fullName : user.username,
              style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 13.5.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(width: 3.w),
            // Icon(
            //   Icons.verified,
            //   size: 12.h,
            //   color: Colors.blue,
            // ),
          ],
        ),
      ],
    );
    ;
  }
}
