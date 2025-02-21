import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/data/models/auth/user_info_model.dart';
import 'package:trend/features/posts/presentation/widgets/Networkimage.dart';
import 'package:trend/shared/const/app_links.dart';

class AvatarAndName extends StatelessWidget {
  const AvatarAndName({required this.onLongPress, required this.user, super.key});
  final void Function() onLongPress;
  final UserInfoModel user;
  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onLongPress: onLongPress,
          child: Networkimages(
            imageUrl: user.avatar?.startsWith('http')==true
                ? user.avatar??'${ApiEndpoints.baseUrl}${user.avatar}':'${ApiEndpoints.baseUrl}${user.avatar}',
            size: 50.r,
          ),
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the text horizontally
          children: [
            Text(
              user.username,
              style: TextStyle(color: const Color.fromARGB(255, 0, 0, 0), fontSize: 13.5.sp, fontWeight: FontWeight.w500),
            ),
            SizedBox(width: 3.w),
            Icon(
              Icons.verified,
              size: 12.h,
              color: Colors.blue,
            ),
          ],
        ),
      ],
    );
  }
}
