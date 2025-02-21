import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/data/models/auth/user_info_model.dart';
import 'package:trend/features/profile/presentation/Pages/user_profile/widgets/custom_User_feature_wighet.dart';

class UserFeatures extends StatelessWidget {
  const UserFeatures({required this.user, super.key});
  final UserInfoModel user;
  @override
  Widget build(final BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 25.w),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          CustomUserFeatureWighet(
            name: 'Posts',
            number: '${user.totalPosts}' ?? '0',
          ),
          CustomUserFeatureWighet(
            name: 'Followers',
            number: '${user.followers}' ?? '0',
          ),
          CustomUserFeatureWighet(
            name: 'Following',
            number: '${user.following}' ?? '0',
          ),
          CustomUserFeatureWighet(
            name: 'Likes',
            number: '${user.totalLikes}' ?? '0',
          ),
        ],
      ),
    );
  }
}
