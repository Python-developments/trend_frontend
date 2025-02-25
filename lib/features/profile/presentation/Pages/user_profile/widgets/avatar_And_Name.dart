import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/features/posts/presentation/widgets/Networkimage.dart';
import 'package:trend/features/profile/data/models/profile_model.dart';
import 'package:trend/shared/const/app_links.dart';

class AvatarAndName extends StatelessWidget {
  const AvatarAndName({super.key, required this.onLongPress, required this.user});
  final void Function() onLongPress;
  final ProfileModel user;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onLongPress: onLongPress,
          child:   CachedNetworkImage(
      imageUrl:  user.avatar,
      errorWidget:(_,__,___)=> Image.asset('assets/images/avatar.jpg'),
      placeholder:(_,__,)=> Image.asset('assets/images/avatar.jpg'),
      height: 50.r,width: 50.r,
    )
        ),
        SizedBox(height: 12.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center, // Center the text horizontally
          children: [
            Text(
              user.user,
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
