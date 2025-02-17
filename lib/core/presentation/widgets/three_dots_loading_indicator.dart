import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/widgets/animated_loading_dot.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';

class ThreeDotsLoadingIndicator extends StatelessWidget {
  const ThreeDotsLoadingIndicator({super.key});

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: 28.r,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          AnimatedLoadingDot.beginning(),
          const CustomSizedBox(
            width: 8,
          ),
          AnimatedLoadingDot.middle(),
          const CustomSizedBox(
            width: 8,
          ),
          AnimatedLoadingDot.end(),
        ],
      ),
    );
  }
}
