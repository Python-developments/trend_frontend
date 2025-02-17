import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/utils/extensions.dart';

class SheetHeader extends StatelessWidget {
  final String title;
  final void Function()? onDismissDialog;
  final bool isInDialog;
  final Color? sheetColor;

  const SheetHeader({
    required this.onDismissDialog,
    required this.sheetColor,
    required this.isInDialog,
    required this.title,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return Container(
      height: 40.h,
      color: sheetColor ?? AppStyle.white,
      padding: EdgeInsets.symmetric(horizontal: 8.w),
      child: Row(
        children: [
          Expanded(
            child: Row(
              children: [
                if (isInDialog)
                  CloseButton(onPressed: () {
                    onDismissDialog?.call();
                    Navigator.pop(context);
                  }),
              ],
            ),
          ),
          Text(
            title.translateWord,
            style: AppStyle.textTheme.bodyLarge!.copyWith(
              color: AppStyle.black.shade900,
              fontWeight: FontWeight.w600,
            ),
          ),
          const Spacer(),
        ],
      ),
    );
  }
}
