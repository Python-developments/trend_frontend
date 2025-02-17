import 'package:flutter/material.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';
import 'package:trend/core/utils/extensions.dart';

class CustomRadioTile<T> extends StatelessWidget {
  final void Function(T?) onTapRadio;
  final T value;
  final T? selectedValue;
  final String title;
  final bool readOnly;
  final Widget? icon;

  const CustomRadioTile(
      {required this.onTapRadio,
      required this.value,
      required this.selectedValue,
      required this.title,
      this.readOnly = false,
      super.key,
      this.icon});

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: readOnly ? () {} : () => onTapRadio(value),
      child: Row(
        children: [
          Radio<T>(
            value: value,
            groupValue: selectedValue,
            activeColor: AppStyle.lightPrimaryColor,
            onChanged: onTapRadio,
          ),
          if (icon != null) ...[
            const CustomSizedBox(
              width: 4,
            ),
            icon!,
            const CustomSizedBox(
              width: 8,
            ),
          ],
          Text(
            title.translateWord,
            style: AppStyle.textTheme.bodyMedium!.copyWith(
                fontWeight: FontWeight.bold,
                color: value == selectedValue
                    ? AppStyle.lightPrimaryColor
                    : AppStyle.black.shade400),
          ),
        ],
      ),
    );
  }
}
