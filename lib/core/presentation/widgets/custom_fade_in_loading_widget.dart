import 'package:flutter/material.dart';
import 'package:trend/core/presentation/widgets/custom_svg_image.dart';
import 'package:trend/core/presentation/assets.dart';

class CustomFadeInLoadingWidget extends StatefulWidget {
  const CustomFadeInLoadingWidget({super.key});

  @override
  State<CustomFadeInLoadingWidget> createState() =>
      _CustomFadeInLoadingWidgetState();
}

class _CustomFadeInLoadingWidgetState extends State<CustomFadeInLoadingWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 1),
    )..addStatusListener((final status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _controller.forward();
        }
      });

    _controller.forward();
  }

  @override
  Widget build(final BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (final _, final __) => Opacity(
        opacity: _controller.value,
        child: const CustomSvgImage(
          path: Assets.wowvir,
          size: 96,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
