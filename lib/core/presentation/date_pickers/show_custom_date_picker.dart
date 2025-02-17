import 'package:flutter/material.dart';
import 'package:flutter_rounded_date_picker/flutter_rounded_date_picker.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/core/utils/extensions.dart';
import 'package:trend/dependencies.dart';

Future<DateTime?> showCustomDatePicker(
    {required final DateTime? startDate,
    required final DateTime? endDate,
    required final DateTime? initialDate,
    final List<DateTime>? disabledDates}) async {
  final TextStyle mediumStyle = AppStyle.textTheme.bodyMedium!,
      largeStyle = AppStyle.textTheme.bodyLarge!,
      hugeStyle = AppStyle.textTheme.titleMedium!;

  return await showRoundedDatePicker(
    height: 400.h,
    context: getAppRouter.currentContext,
    locale: Locale("en"),
    initialDate: initialDate,
    firstDate: startDate,
    lastDate: endDate,
    listDateDisabled: disabledDates,
    styleYearPicker: MaterialRoundedYearPickerStyle(
        textStyleYearSelected: hugeStyle,
        textStyleYear: largeStyle,
        backgroundPicker: AppStyle.white),
    styleDatePicker: MaterialRoundedDatePickerStyle(
        backgroundPicker: AppStyle.white,
        textStyleDayOnCalendar: mediumStyle,
        textStyleDayOnCalendarSelected: largeStyle.copyWith(
            fontWeight: FontWeight.bold, color: AppStyle.white),
        textStyleMonthYearHeader: largeStyle,
        textStyleYearButton: largeStyle.copyWith(color: AppStyle.white),
        textStyleDayButton: hugeStyle.copyWith(color: AppStyle.white),
        textStyleButtonPositive:
            largeStyle.copyWith(color: AppStyle.blue),
        textStyleButtonNegative:
            largeStyle.copyWith(color: AppStyle.blue),
        decorationDateSelected: const BoxDecoration(
            shape: BoxShape.circle, color: AppStyle.blue)),
    theme: ThemeData(
      primaryColor: AppStyle.blue,
    ),
  );
}
