import 'package:flutter/material.dart';
import 'package:trend/data/models/auth/user_profile_model.dart';
import 'package:trend/features/profile/presentation/Pages/user_profile/widgets/PrivateWidget.dart';
import 'package:trend/features/profile/presentation/Pages/user_profile/widgets/posts_in_user_body.dart';

class PrivateOrDiplayPosts extends StatelessWidget {
  const PrivateOrDiplayPosts({super.key, required this.user});
  final UserProfileModel user;
  @override
  Widget build(BuildContext context) {
    return (user.isPrivate)
        ? PrivateWidget()
        : PostsInUserBody(userid: user.id);
  }
}
