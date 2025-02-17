import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/app_style.dart';

class CustomLinearIndicator extends StatelessWidget {
  final double value;
  final BorderRadius borderRadius;
  const CustomLinearIndicator(
      {required this.value, required this.borderRadius, super.key});

  @override
  Widget build(final BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: AppStyle.black.shade200,
      color: AppStyle.blue,
      minHeight: 4.h,
      value: value,
      borderRadius: borderRadius,
    );
  }
}
