import 'dart:math';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend/shared/const/app_image.dart';
import 'package:trend/shared/style/app_styles.dart';

import '../../../../main.dart';
import '../../../../shared/utiles/routes.dart';
import '../../../../shared/utiles/securely _save.dart';
import '../../../../shared/utiles/services_local.dart';
import '../../../auth/presentation/manager/refresh_token_bloc.dart';
import '../../../auth/presentation/manager/refresh_token_event.dart';
import '../../../auth/presentation/manager/refresh_token_state.dart';




class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});


  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        final bloc = RefreshTokenBloc(refreshTokenUseCase: sl());
        bloc.add(RefreshTokenEvent(oldToken: refreshToken ??""));
        print("-------------------------$refreshToken------------------------------------");

        return bloc;
      },
      child: BlocListener<RefreshTokenBloc, RefreshTokenState>(
        listener: (context, state){
          Future.delayed(const Duration(milliseconds: 1200), ()async{
            if (state is RefreshTokenSuccess) {
              await saveRefreshToken(state.refreshTokenModel.refresh ?? "");
              await saveAccessToken(state.refreshTokenModel.access ?? "");
              Navigator.of(context).pushReplacementNamed(AppRoutes.home);
            } else if (state is RefreshTokenError) {
              Navigator.of(context).pushReplacementNamed(AppRoutes.login);
            }
          });
        },
        child: const SplashScreenUI(),
      ),
    );
  }
}

class SplashScreenUI extends StatelessWidget {
  const SplashScreenUI({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20),
        child: Text(
          "Developed by Trend",
          textAlign: TextAlign.center,
          style: AppStyles.styleNormal17(context),
        ),
      ),
      backgroundColor: Colors.white,
      body: const Center(child: BouncingAnimationWidget()),
    );
  }
}







class BouncingAnimationWidget extends StatefulWidget {
  const BouncingAnimationWidget({Key? key}) : super(key: key);

  @override
  State<BouncingAnimationWidget> createState() =>
      _BouncingAnimationWidgetState();
}
class _BouncingAnimationWidgetState
    extends State<BouncingAnimationWidget>
    with SingleTickerProviderStateMixin {
  late final AnimationController _controller;
  late final Animation<double> _boxJumpHeight;
  late final Animation<double> _boxWidth;
  late final Animation<double> _boxShadowWidth;
  late final Animation<double> _boxShadowIntensity;
  late final Animation<double> _boxRotationAngle;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 500),
      vsync: this,
    );
    _initJumpAnimation();
    _initBoxWidthAnimation();
    _initBoxShadowWidthAnimation();
    _initBoxShadowIntensityAnimation();
    _initBoxRotationAnimation();
    _playAnimation();
  }

  void _initJumpAnimation() => _boxJumpHeight = Tween<double>(
        begin: -0.07,
        end: -0.5,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(
            0.0,
            1.0,
            curve: Curves.easeInOut,
          ),
        ),
      );

  void _initBoxRotationAnimation() =>
      _boxRotationAngle = Tween<double>(
        begin: 0,
        end: 360,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(
            0.25,
            1.0,
            curve: Curves.ease,
          ),
        ),
      );

  void _initBoxWidthAnimation() => _boxWidth = Tween<double>(
        begin: 240,
        end: 120,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(
            0.05,
            0.3,
            curve: Curves.ease,
          ),
        ),
      );

  void _initBoxShadowWidthAnimation() =>
      _boxShadowWidth = Tween<double>(
        begin: 240,
        end: 60,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(
            0.05,
            0.5,
            curve: Curves.ease,
          ),
        ),
      );

  void _initBoxShadowIntensityAnimation() =>
      _boxShadowIntensity = Tween<double>(
        begin: 0.15,
        end: 0.05,
      ).animate(
        CurvedAnimation(
          parent: _controller,
          curve: const Interval(
            0.05,
            1.0,
            curve: Curves.ease,
          ),
        ),
      );

  @override
  Widget build(BuildContext context) => AnimatedBuilder(
        builder: (context, _) => _buildAnimation(context),
        animation: _controller,
      );

  Widget _buildAnimation(BuildContext context) => Stack(
        alignment: Alignment.center,
        children: [
          _boxShadow(context),
          Align(
            alignment: Alignment(0.0, _boxJumpHeight.value),
            child: _animatedBox(context),
          ),
        ],
      );

  Future<void> _playAnimation() async {
    try {
      await _controller.forward().orCancel;
      await _controller.reverse().orCancel;
      _playAnimation();
    } on TickerCanceled {}
  }

  Widget _boxShadow(BuildContext context) => Container(
        width: _boxShadowWidth.value,
        height: 15,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
              Radius.elliptical(_boxShadowWidth.value, 15)),
          boxShadow: [
            BoxShadow(
              color:
                  Colors.black.withOpacity(_boxShadowIntensity.value),
              spreadRadius: 5,
              blurRadius: 4,
              offset: const Offset(0, 3),
            ),
          ],
        ),
      );

  Widget _animatedBox(BuildContext context) {
    return Transform(
      alignment: Alignment.center,
      transform: _boxRotation(_controller.status),
      child: SizedBox(
        width: _boxWidth.value,
        height: 300,
        child: Image.asset(
          AppImage.logo,
        ),
      ),
    );
  }

  Matrix4 _boxRotation(AnimationStatus animationStatus) {
    if (animationStatus == AnimationStatus.reverse) {
      return Matrix4.identity()
        ..rotateZ(-_boxRotationAngle.value * pi / 180);
    } else {
      return Matrix4.identity()
        ..rotateZ(_boxRotationAngle.value * pi / 180);
    }
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
