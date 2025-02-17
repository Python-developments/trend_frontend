
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:injectable/injectable.dart';
import 'package:toastification/toastification.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/utils/enums.dart';


@singleton
class SnakeBarShower{
  final GlobalKey<ScaffoldMessengerState> snakeBarKey = GlobalKey<ScaffoldMessengerState>();
  void showSnakeBar(final String message,final ToastType type) {
    late Color backgroundColor,fontColor;
    late IconData iconData;
    switch (type) {
      case ToastType.success:
        backgroundColor = AppStyle.confirmationColor;
        fontColor = Colors.white;
        iconData = Icons.check_circle_outline;

        break;
      case ToastType.error:
        backgroundColor = AppStyle.warringColor;
        fontColor = AppStyle.black;
        iconData = Icons.error_outline;

        break;
    }
    toastification.dismissAll();
    toastification.show(
        title: Row(
          children: [
            Expanded(
              child: Text(message,style: AppStyle.textTheme.bodyMedium!.copyWith(
                  color: fontColor,
                  fontWeight: FontWeight.bold),
                maxLines: 3,

              ),
            ),
          ],
        ),
        autoCloseDuration: const Duration(seconds: 4),
        style: ToastificationStyle.fillColored,
        primaryColor: backgroundColor,
        backgroundColor: backgroundColor,
        icon: Icon(iconData,color: fontColor,size: 24.r,),
        foregroundColor: fontColor,
        progressBarTheme:ProgressIndicatorThemeData(
          color: fontColor,
          linearTrackColor: backgroundColor
        )



    );
/*

  snackbarKey.currentState?.clearSnakeBars();


  snackbarKey.currentState?.showSnakeBar(SnakeBar(

    backgroundColor: backgroundColor,
    duration: const Duration(seconds: 1),
    behavior: SnakeBarBehavior.floating,

    content: Text(message,style: AppStyle.textTheme.bodyMedium!.copyWith(color: Colors.white,
        fontWeight: FontWeight.bold),),
  ));*/

  }
}



