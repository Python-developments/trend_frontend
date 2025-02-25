import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/features/notifications/domain/entities/notification.dart';
import 'package:trend/features/notifications/presentation/pages/Widget/Get_Icon_For_Notification.dart';
import 'package:trend/features/posts/presentation/widgets/Networkimage.dart';
import 'package:trend/features/profile/presentation/Manager/Bloc_get_User/bloc_get.dart';
import 'package:trend/features/profile/presentation/Manager/Bloc_get_User/event_getU.dart';
import 'package:trend/shared/utiles/routes.dart';

class NotificationAvatar extends StatelessWidget {
  const NotificationAvatar({super.key, required this.notification});
  final NotificationModel notification;
  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        CircleAvatar(
          radius: 18,
          backgroundColor: Colors.white,
          child: GestureDetector(
            onTap: () {
              BlocProvider.of<UserBloc>(context).add(
                FetchUserEvent2(notification.actor.id),
              );
              Navigator.pushNamed(context, AppRoutes.userProfile);
            },
            child: ClipOval(
              child:CachedNetworkImage(
                imageUrl:  '',
                errorWidget:(_,__,___)=> Image.asset('assets/images/avatar.jpg'),
                placeholder:(_,__,)=> Image.asset('assets/images/avatar.jpg'),
                width: 50.r,height: 50.r,
              ),
            ),
          ),
        ),
        Positioned(
            top: 23, left: 25, child: GetIconForNotification(notification.verb))
      ],
    );
  }
}
