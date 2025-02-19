import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/data/errors/core_errors.dart';

class CustomDropdownField<T> extends StatelessWidget {
  final String title;
  final void Function(T?) onSelectOption;
  final List<T> options;
  final T? selectedOption;
  final String Function(T) titleGetter;
  final String Function(T) valueGetter;
  const CustomDropdownField({
    required this.valueGetter,
    required this.selectedOption,
    required this.title,
    required this.onSelectOption,
    required this.options,
    required this.titleGetter,
    super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return DropdownButtonFormField<String>(
      dropdownColor: AppStyle.white,
      iconEnabledColor:
          selectedOption != null ? AppStyle.white : AppStyle.blue,
      value: selectedOption == null ? null : valueGetter(selectedOption as T),
      decoration: InputDecoration(
        filled: true,
        fillColor: selectedOption != null
            ? AppStyle.blue
            : AppStyle.white,
        errorBorder: const OutlineInputBorder(
          borderRadius: AppStyle.borderRadius,
          borderSide: BorderSide(color: AppStyle.errorColor),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: AppStyle.borderRadius,
          borderSide: BorderSide(color: AppStyle.errorColor),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: AppStyle.borderRadius,
          borderSide: BorderSide(color: AppStyle.blue),
        ),
        border: const OutlineInputBorder(
          borderRadius: AppStyle.borderRadius,
          borderSide: BorderSide(color: AppStyle.blue),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: AppStyle.borderRadius,
          borderSide: BorderSide(color: AppStyle.blue),
        ),
      ),
      validator: (final value) => value == null
          ? IsNotSelectedError(fieldName: title).errorMessage
          : null,
      items: options
          .map((final e) => DropdownMenuItem<String>(
              value: valueGetter(e),
              child: Container(
                  height: 40.h,
                  color: selectedOption != null &&
                          (valueGetter(e) == valueGetter(selectedOption as T))
                      ? AppStyle.blue
                      : Colors.transparent,
                  child: Center(
                      child: Text(
                    titleGetter(e),
                    style: AppStyle.textTheme.bodyMedium!.copyWith(
                      color: selectedOption != null &&
                              (valueGetter(e) == valueGetter(selectedOption as T))
                          ? AppStyle.white
                          : AppStyle.blue,
                    ),
                  )))))
          .toList(),
      onChanged: (final value) {
        value == null
            ? onSelectOption(null)
            : onSelectOption(options
                .firstWhere((final element) => valueGetter(element) == value));
      },
      hint: Text(
        title,
        style: AppStyle.textTheme.bodyMedium,
      ),
    );
  }
}
