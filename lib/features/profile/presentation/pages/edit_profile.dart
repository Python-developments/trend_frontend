/*
import 'dart:io';

import 'package:flutter/material.dart';

import 'package:image_picker/image_picker.dart';
import 'package:trend/data/models/auth/user_profile_model.dart';
import 'package:trend/features/profile/presentation/Manager/bloc/profile_bloc.dart';
import 'package:trend/features/profile/presentation/Manager/bloc/profile_event.dart';
import 'package:trend/features/profile/presentation/Manager/bloc/profile_state.dart';
import 'package:trend/features/profile/presentation/Pages/EditPage.dart';
import 'package:trend/features/profile/presentation/Pages/my_profile/widgets/AnimatedAvatarWidget.dart';
import 'package:trend/features/profile/presentation/Pages/user_profile/widgets/custom_Backdrop_Filter.dart';
import 'package:trend/shared/const/app_links.dart';


class EditProfilePage extends StatefulWidget {
  const EditProfilePage({
    Key? key,
    required this.user,
  }) : super(key: key);
  final UserProfileModel user;
  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {

  @override
  Widget build(BuildContext context) {
        return Stack(
          children: [
            EditPage(
              user: widget.user,
              onTap: () {},
            ),
            customBackdropFilter(
            ),
            AnimatedAvatarWidget( avatarUrl: '${ApiEndpoints.baseUrl}${widget.user.avatar}')
          ],
        );
      },
    );
  }
}
*/
