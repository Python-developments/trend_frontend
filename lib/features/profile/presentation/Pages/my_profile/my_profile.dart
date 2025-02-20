import 'package:flutter/material.dart';
import 'package:trend/features/profile/presentation/Pages/my_profile/widgets/AnimatedAvatarWidget.dart';
import 'package:trend/features/profile/presentation/Pages/my_profile/widgets/body_Myprofile.dart';
import 'package:trend/features/profile/presentation/Pages/user_profile/widgets/custom_Backdrop_Filter.dart';

class MyProfilePage extends StatefulWidget {
  const MyProfilePage({super.key});

  @override
  State<MyProfilePage> createState() => _MyProfilePageState();
}

class _MyProfilePageState extends State<MyProfilePage> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BodyForMyProfile(),
        customBackdropFilter(),
        AnimatedAvatarWidget(
          avatarUrl: '',
        )
      ],
    );
  }
}
