import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/core/presentation/sheets/sheet_header.dart';
import 'package:trend/core/utils/extensions.dart';

Future<void> showCustomBottomSheet(
    {required final String sheetTitle,
    required final Widget sheetWidget,
    required final double height,
    required final void Function()? onDismissDialog}) {
  // snapping Heights is percent value of the screen that the sheet stops on

  return showSlidingBottomSheet(getAppRouter.currentContext,
      builder: (final ctx) => SlidingSheetDialog(
            onDismissPrevented: (
                    {required final bool backButton,
                    required final bool backDrop}) =>
                onDismissDialog?.call(),
            duration: const Duration(milliseconds: 300),
            cornerRadius: 4,
            padding: EdgeInsets.only(top: 8.h),
            isDismissable: onDismissDialog != null,
            backdropColor: AppStyle.black.withOpacity(0.6),
            avoidStatusBar: true,
            isBackdropInteractable: true,
            extendBody: true,
            color: AppStyle.white,
            snapSpec: const SnapSpec(
              snap: true,
              snappings: [0.4, 1.0],
              initialSnap: 1.0,
            ),
            builder: (final _, final __) => Material(
              color: AppStyle.white,
              child: Column(
                    children: [
                      SheetHeader(
                        title: sheetTitle,
                        onDismissDialog: onDismissDialog,
                        isInDialog: true,
                        sheetColor: null,
                      ),
              SizedBox(
                height: height.h,
                child: SingleChildScrollView(
                  child:sheetWidget)),
                    ],
                  ),
                ),

          ));
}
