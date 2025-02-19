import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/widgets/custom_svg_image.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/assets.dart';
import 'package:trend/core/presentation/date_pickers/show_custom_date_picker.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';
import 'package:trend/core/utils/extensions.dart';

class DatePickerTextField extends StatefulWidget {
  final DateTime? startDate, endDate, initialDate;
  final String title;
  final void Function(DateTime?) onChangeDateTime;
  const DatePickerTextField(
      {required this.startDate,
      required this.endDate,
      required this.initialDate,
      required this.title,
      required this.onChangeDateTime,
      super.key});

  @override
  State<DatePickerTextField> createState() => _DatePickerTextFieldState();
}

class _DatePickerTextFieldState extends State<DatePickerTextField> {
  DateTime? selectedDate;

  @override
  void initState() {
    selectedDate = widget.initialDate;
    super.initState();
  }

  @override
  void didUpdateWidget(covariant final DatePickerTextField oldWidget) {
    selectedDate = widget.initialDate;
    super.didUpdateWidget(oldWidget);
  }

  void changeSelectedDate(final DateTime? newDate) => setState(() {
        selectedDate = newDate;
        widget.onChangeDateTime(selectedDate);
      });

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: () async => changeSelectedDate(await showCustomDatePicker(
              startDate: widget.startDate,
              endDate: widget.endDate,
              initialDate: selectedDate,
            )),
      child: Container(
        height: 52.h,
        padding: EdgeInsets.all(16.r),
        decoration: BoxDecoration(
          color: AppStyle.black.shade100,
          borderRadius: AppStyle.borderRadius,
        ),
        child: Row(
          children: [
            const CustomSvgImage(path: Assets.clock),
            const CustomSizedBox(
              width: 32,
            ),
            Text(
              selectedDate?.dayFormat ?? widget.title,
              style: AppStyle.textTheme.bodyMedium!
                  .copyWith(color: AppStyle.black.shade600),
            )
          ],
        ),
      ),
    );
  }
}
