import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/controllers/auth_controller.dart';
import 'package:trend/dependencies.dart';
import 'package:trend/features/profile/presentation/Pages/my_profile/widgets/DisplayBio.dart';
import 'package:trend/features/profile/presentation/Pages/my_profile/widgets/Dsiplay_My_posts_in_body.dart';
import 'package:trend/features/profile/presentation/Pages/my_profile/widgets/EditAndSetting.dart';
import 'package:trend/features/profile/presentation/Pages/my_profile/widgets/MyNameAndAvatar.dart';
import 'package:trend/features/profile/presentation/Pages/user_profile/widgets/custom_User_feature_wighet.dart';
import 'package:trend/features/profile/presentation/pages/my_profile/widgets/AnimatedAvatarWidget.dart';


class BodyForMyProfile extends StatelessWidget {
   BodyForMyProfile({super.key});

  final AuthController authController=getIt<AuthController>();
  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Observer(
        builder: (final context) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(), // Enables smooth scrolling
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 80.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  AnimatedAvatarWidget(avatarUrl: '',),
                  if(authController.userProfileModel!=null)
                  Mynameandavatar(
                    onLongPress: (){},
                    user: authController.userProfileModel!,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 25.w),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [

                           CustomUserFeatureWighet(
                                number: authController.userProfileModel?.totalPosts.toString()??'', name: 'Posts'),

                             GestureDetector(
                              onTap: () {
                              },
                              child: CustomUserFeatureWighet(
                                  number: authController.userProfileModel?.followers.toString()??'', name: 'Followers'),
                            ),


                             GestureDetector(
                              onTap: () {
                              },
                              child: CustomUserFeatureWighet(
                                  number: authController.userProfileModel?.following.toString()??'', name: 'Following'),

                        ),
                        CustomUserFeatureWighet(
                            number: authController.userProfileModel?.totalLikes.toString()??'', name: 'Likes'),
                      ],
                    ),
                  ),
                  SizedBox(height: 5.h),
                  Editandsetting(
                    onTap: () {},
                  ),
                  SizedBox(height: 10.h),
                  if(authController.userProfileModel!=null)
                  Displaybio(
                    user: authController.userProfileModel!.profile,
                  ),
                  SizedBox(height: 10.h),
                  DsiplayMyPostsInBody()
                ],
              ),
            ),
          );
        }
      ),
    );
  }
}
