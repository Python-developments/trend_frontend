import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/app_style.dart';

class AnimatedLoadingDot extends StatefulWidget {
  final double initialValue;

  const AnimatedLoadingDot({required this.initialValue, super.key});

  factory AnimatedLoadingDot.beginning() =>
      const AnimatedLoadingDot(initialValue: 0);
  factory AnimatedLoadingDot.middle() =>
      const AnimatedLoadingDot(initialValue: pi / 2);
  factory AnimatedLoadingDot.end() =>
      const AnimatedLoadingDot(initialValue: pi);

  @override
  State<AnimatedLoadingDot> createState() => _AnimatedLoadingDotState();
}

class _AnimatedLoadingDotState extends State<AnimatedLoadingDot>
    with TickerProviderStateMixin {
  late AnimationController controller;
  late Animation sizeAnimation;
  @override
  void initState() {
    controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..repeat();
    sizeAnimation = Tween(begin: 0, end: pi * 2).animate(controller);
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return AnimatedBuilder(
        animation: sizeAnimation,
        builder: (final ctx, final child) => Container(
              height:
                  8.r + (sin(sizeAnimation.value + widget.initialValue) * 4).r,
              width:
                  8.r + (sin(sizeAnimation.value + widget.initialValue) * 4).r,
              decoration: const BoxDecoration(
                  color: AppStyle.blue, shape: BoxShape.circle),
            ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
