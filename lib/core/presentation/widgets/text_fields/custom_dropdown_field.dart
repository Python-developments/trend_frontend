import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/utils/extensions.dart';
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
          selectedOption != null ? AppStyle.white : AppStyle.lightPrimaryColor,
      value: selectedOption == null ? null : valueGetter(selectedOption as T),
      decoration: InputDecoration(
        filled: true,
        fillColor: selectedOption != null
            ? AppStyle.lightPrimaryColor
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
          borderSide: BorderSide(color: AppStyle.lightPrimaryColor),
        ),
        border: const OutlineInputBorder(
          borderRadius: AppStyle.borderRadius,
          borderSide: BorderSide(color: AppStyle.lightPrimaryColor),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: AppStyle.borderRadius,
          borderSide: BorderSide(color: AppStyle.lightPrimaryColor),
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
                      ? AppStyle.lightPrimaryColor
                      : Colors.transparent,
                  child: Center(
                      child: Text(
                    titleGetter(e),
                    style: AppStyle.textTheme.bodyMedium!.copyWith(
                      color: selectedOption != null &&
                              (valueGetter(e) == valueGetter(selectedOption as T))
                          ? AppStyle.white
                          : AppStyle.lightPrimaryColor,
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
        title.translateWord,
        style: AppStyle.textTheme.bodyMedium,
      ),
    );
  }
}
