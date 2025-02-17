import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/widgets/custom_svg_image.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/widgets/close_widget.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';
import 'package:trend/core/presentation/widgets/main_button.dart';
import 'package:trend/core/presentation/widgets/secondary_button.dart';
import 'package:trend/core/utils/extensions.dart';

class CustomImageDialog extends StatelessWidget {
  final String imagePath, mainActionTitle, content;
  final String? subtitle;
  final double imageSize;

  final void Function() onMainActionPressed;
  final void Function()? onCloseButtonPressed;
  final (String, void Function())? secondaryButton;

  const CustomImageDialog({
    required this.imagePath,
    required this.mainActionTitle,
    required this.content,
    required this.onMainActionPressed,
    super.key,
    this.subtitle,
    this.onCloseButtonPressed,
    this.imageSize = 24,
    this.secondaryButton,
  });

  @override
  Widget build(final BuildContext context) {
    return AlertDialog(
      titlePadding: EdgeInsets.symmetric(vertical: 16.r),
      contentPadding: EdgeInsets.all(16.r),
      actionsPadding: EdgeInsets.all(16.r),
      surfaceTintColor: Colors.transparent,
      backgroundColor: AppStyle.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              const Spacer(),
              CloseWidget(onPressed: onCloseButtonPressed, ),
              const CustomSizedBox(
                width: 16,
              ),
            ],
          ),
          const CustomSizedBox(
            height: 8,
          ),
          CustomSvgImage(path: imagePath, size: imageSize,),
        ],
      ),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(
            content.translateWord,
            style: AppStyle.textTheme.titleMedium,
            textAlign: TextAlign.center,
          ),
          if (subtitle != null) ...[
            const CustomSizedBox(
              height: 8,
            ),
            Text(
              subtitle!.translateWord,
              style: AppStyle.textTheme.bodyMedium,
              textAlign: TextAlign.center,
            ),
          ]
        ],
      ),
      actions: [
        Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            MainButton(
                isLoading: false,
                title: mainActionTitle.translateWord,
                onPressed: onMainActionPressed),
            if (secondaryButton != null) ...[
              const CustomSizedBox(
                height: 8,
              ),
              SecondaryButton(
                title: secondaryButton!.$1.translateWord,
                onPressed: secondaryButton!.$2,
              )
            ]
          ],
        ),
      ],
    );
  }
}
