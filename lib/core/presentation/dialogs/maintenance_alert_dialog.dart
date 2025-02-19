import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/assets.dart';
import 'package:trend/core/presentation/widgets/custom_svg_image.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';

class MaintenanceAlertDialog extends StatelessWidget {
  const MaintenanceAlertDialog({super.key});


  @override
  Widget build(final BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.symmetric(vertical: 16.r),
      contentPadding: EdgeInsets.symmetric(horizontal: 16.r,vertical: 8.h),
      actionsPadding: EdgeInsets.all(8.r),
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppStyle.white,

      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          const CustomSizedBox(
            height: 16,
          ),
          const CustomSvgImage(path: Assets.maintenanceSystem, size: 122,),
          const CustomSizedBox(
            height: 16,
          ),
          Text(
            'We’ll Be Back Soon!',
            style: AppStyle.textTheme.titleMedium,

            textAlign: TextAlign.center,
          ),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
            Text(
              'We’re busy with fantastic updates. We appreciate your patience.',
              style: AppStyle.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          const CustomSizedBox(
            height: 16,
          ),

        ],
      ),

    );
  }
}
