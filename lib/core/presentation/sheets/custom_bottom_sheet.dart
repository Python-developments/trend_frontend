import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:wtf_sliding_sheet/wtf_sliding_sheet.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/sheets/sheet_header.dart';

class CustomBottomSheet extends StatelessWidget {
  final String sheetTitle;
  final Widget sheetWidget;
  final double height;
  final Color? sheetColor;
  const CustomBottomSheet(
      {required this.sheetTitle,
      required this.sheetWidget,
      required this.height,
      super.key,
      this.sheetColor});

  @override
  Widget build(final BuildContext context) {
    return SlidingSheet(
      openDuration: const Duration(milliseconds: 300),
      cornerRadius: 4,
      padding: EdgeInsets.only(top: 8.h),
      isBackdropInteractable: true,
      extendBody: false,
      color: sheetColor ?? AppStyle.white,
      builder: (final _, final __) => Material(
        color: sheetColor ?? AppStyle.white,
        child: SizedBox(
          height: height.h,
          child: SingleChildScrollView(
            child: Column(
              children: [
                SheetHeader(
                  title: sheetTitle,
                  onDismissDialog: null,
                  isInDialog: false,
                  sheetColor: sheetColor,
                ),
                sheetWidget
              ],
            ),
          ),
        ),
      ),
    );
  }
}
