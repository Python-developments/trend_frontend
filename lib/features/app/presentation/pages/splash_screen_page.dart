import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:trend/core/presentation/app_style.dart';

@RoutePage()
class SplashScreenPage extends StatelessWidget {
  const SplashScreenPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.white,
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
