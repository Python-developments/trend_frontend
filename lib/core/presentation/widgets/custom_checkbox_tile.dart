import 'package:flutter/material.dart';
import 'package:trend/core/presentation/app_style.dart';

class CustomCheckboxTile extends StatelessWidget {
  final void Function() onTap;
  final bool isSelected;
  final String title;

  const CustomCheckboxTile(
      {required this.onTap,
      required this.isSelected,
      required this.title,
      super.key});

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
        onTap: onTap,
        child: ColoredBox(
          color: isSelected ? AppStyle.lightGray : AppStyle.white,
          child: Row(
            children: [
              Checkbox(
                  side: const BorderSide(color: AppStyle.blue),
                  value: isSelected,
                  checkColor: AppStyle.white,
                  activeColor: AppStyle.blue,
                  onChanged: (final _) => onTap()),
              Text(
                title,
                style: AppStyle.textTheme.bodyMedium,
              ),
            ],
          ),
        ));
  }
}
