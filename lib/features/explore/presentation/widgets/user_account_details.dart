/*
import 'package:flutter/material.dart';
import 'package:trend/core/presentation/app_style.dart';

import 'package:trend/features/profile/presentation/Manager/Bloc_get_User/bloc_get.dart';
import 'package:trend/features/profile/presentation/Manager/Bloc_get_User/event_getU.dart';



class UserAccountDetails extends StatelessWidget {
  const UserAccountDetails({Key? key, required this.model}) : super(key: key);
  final UserDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppStyle.white,
      child: ListTile(
        contentPadding: EdgeInsets.symmetric(horizontal: 13, vertical: 9),
        leading: CircleAvatar(
          radius: 28,
          backgroundImage: NetworkImage(model.avatar),
          backgroundColor: Colors.transparent,
        ),
        title: Text(
          model.username,
          style: AppStyle.styleBold16,
        ),
        subtitle: Text(
          model.full_name,
          style: AppStyle.textTheme!.bodySmall!.copyWith(
              color: AppStyle.black.shade400,
          )),
        ),
        horizontalTitleGap: 14,
        minTileHeight: 60,
        onTap: () {
          BlocProvider.of<UserBloc>(context)
              .add(FetchUserEvent2(int.parse(model.id) ?? 0));
          Navigator.pushNamed(context, AppRoutes.userProfile);
        },
      ),
    );
  }
}
*/
