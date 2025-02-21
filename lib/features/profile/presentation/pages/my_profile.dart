import 'package:flutter/material.dart';
import 'package:trend/features/profile/presentation/Pages/my_profile/widgets/AnimatedAvatarWidget.dart';
import 'package:trend/features/profile/presentation/Pages/my_profile/widgets/body_Myprofile.dart';
import 'package:trend/features/profile/presentation/Pages/user_profile/widgets/custom_Backdrop_Filter.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Stack(
      children: [
        BodyForMyProfile(),
        //customBackdropFilter(),
      ],
    );
  }
}
