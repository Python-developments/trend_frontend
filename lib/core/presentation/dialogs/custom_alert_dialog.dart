import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/widgets/main_button.dart';
import 'package:trend/core/presentation/widgets/negative_button.dart';
import 'package:trend/core/presentation/widgets/secondary_button.dart';
import 'package:trend/core/utils/extensions.dart';

class CustomAlertDialog extends StatelessWidget {
  final String title, mainActionText;
  final String? content;
  final bool isDismissible;
  final void Function() onMainActionPressed;
  final (
    String title,
    void Function() onPressed,
    bool isAlertDialog
  )? secondaryButton;
  const CustomAlertDialog({
    required this.title,
    required this.mainActionText,
    required this.onMainActionPressed,
    super.key,
    this.content,
    this.isDismissible = true,
    this.secondaryButton,
  });

  @override
  Widget build(final BuildContext context) {
    return AlertDialog.adaptive(
        title: Text(
          title,
          style: AppStyle.textTheme.bodyLarge,
          textAlign: TextAlign.center,
        ),
        titlePadding: EdgeInsets.all(8.r),
        contentPadding: EdgeInsets.all(8.r),
        actionsPadding: EdgeInsets.all(8.r),
        shape:
            const RoundedRectangleBorder(borderRadius: AppStyle.borderRadius),
        content: content != null
            ? Text(
                content!,
                style: AppStyle.textTheme.bodyMedium,
                textAlign: TextAlign.center,
              )
            : null,
        actionsAlignment: MainAxisAlignment.spaceAround,
        actions: Platform.isIOS
            ? [
                CupertinoDialogAction(
                    onPressed: onMainActionPressed,
                    child: Text(mainActionText,
                        style: AppStyle.textTheme.bodyLarge!.copyWith(
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w400))),
                if (secondaryButton != null)
                  CupertinoDialogAction(
                      onPressed: secondaryButton!.$2,
                      child: Text(secondaryButton!.$1,
                          style: AppStyle.textTheme.bodyLarge!.copyWith(
                              color: secondaryButton!.$3
                                  ? AppStyle.errorColor
                                  : Colors.blueAccent,
                              fontWeight: FontWeight.w400))),
              ]
            : [
                MainButton(
                    isLoading: false,
                    title: mainActionText,
                    onPressed: onMainActionPressed),
                if (secondaryButton != null && secondaryButton!.$3)
                  NegativeButton(
                    title: secondaryButton!.$1,
                    onPressed: secondaryButton!.$2,
                  ),
                if (secondaryButton != null && !secondaryButton!.$3)
                  SecondaryButton(
                    title: secondaryButton!.$1,
                    onPressed: secondaryButton!.$2,
                  ),
              ]);
  }
}
