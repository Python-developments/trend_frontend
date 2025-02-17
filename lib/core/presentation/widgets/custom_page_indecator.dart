import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:trend/core/presentation/app_style.dart';

class CustomPagesIndicator extends StatelessWidget {
  final int selectedPage, totalPages;

  const CustomPagesIndicator(
      {required this.totalPages, required this.selectedPage, super.key});

  @override
  Widget build(final BuildContext context) {
    return AnimatedSmoothIndicator(
      activeIndex: selectedPage,
      count: totalPages,
      effect: ExpandingDotsEffect(
        dotHeight: 4.h,
        dotWidth: 8.w,
        dotColor: AppStyle.lightPink,
        activeDotColor: AppStyle.darkPrimaryColor,
      ),
    );
  }
}
