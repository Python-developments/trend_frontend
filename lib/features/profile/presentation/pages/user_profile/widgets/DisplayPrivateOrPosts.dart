import 'package:flutter/material.dart';
import 'package:trend/data/models/auth/user_info_model.dart';
import 'package:trend/features/profile/presentation/Pages/user_profile/widgets/PrivateWidget.dart';
import 'package:trend/features/profile/presentation/Pages/user_profile/widgets/posts_in_user_body.dart';

class PrivateOrDiplayPosts extends StatelessWidget {
  const PrivateOrDiplayPosts({required this.user, super.key});
  final UserInfoModel user;
  @override
  Widget build(final BuildContext context) {
    return (user.profile.isPrivate)
        ? PrivateWidget()
        : PostsInUserBody(userid: user.id);
  }
}
