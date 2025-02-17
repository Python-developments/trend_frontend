import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:lottie/lottie.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/assets.dart';

@RoutePage()
class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
        body:Container(
          height: 1.sh,
            width: 1.sw,
            decoration: const BoxDecoration(
              color: AppStyle.blue,
            ),
            child: Lottie.asset(Assets.splashAnimation)),
/*    body: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            Assets.splashScreen,
            fit: BoxFit.cover,
          ),
          const Column(
            children: [
              Spacer(),
              CircularProgressIndicator(
                color: AppStyle.white,
              ),
              CustomSizedBox(height: 64),
            ],
          )
        ],
      ),*/
    );
  }
}
