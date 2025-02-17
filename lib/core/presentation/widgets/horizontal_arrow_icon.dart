import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/controllers/localization_controller.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/dependencies.dart';

class HorizontalArrowIcon extends StatelessWidget {
   final double size;
   final void Function()? onTap;
  final bool isLeftInEnglish;
  final Color? color;
  const HorizontalArrowIcon({required this.size, super.key, this.onTap,  this.isLeftInEnglish=true, this.color});

  @override
  Widget build(final BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Center(
          child:Icon(
            !getIt<LocalizationController>().isRtlLanguage?isLeftInEnglish
                ? Icons.arrow_back_ios_new
                : Icons.arrow_forward_ios
                :!isLeftInEnglish
                ? Icons.arrow_back_ios_new
                : Icons.arrow_forward_ios,
            size: size.r,
            color: color ?? AppStyle.black.shade900,
            textDirection: TextDirection.ltr,
          )
      ),
    );
  }
}
