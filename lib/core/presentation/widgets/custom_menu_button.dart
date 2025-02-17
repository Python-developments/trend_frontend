import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/app_style.dart';

class CustomMenuButton<T> extends StatelessWidget {
  final T? selectedValue;
  final List<T> items;
  final void Function(T) onChangeValue;
  final String Function(T) titleGetter;

  const CustomMenuButton(
      {required this.selectedValue,
      required this.items,
      required this.onChangeValue,
      required this.titleGetter,
      super.key});
  @override
  Widget build(final BuildContext context) {
    return PopupMenuButton<T>(
      onSelected: onChangeValue,
      initialValue: selectedValue,
      color: Colors.white,
      itemBuilder: (final _) => items
          .map((final e) => PopupMenuItem<T>(
                value: e,
                child: Text(
                  titleGetter(e),
                  style: AppStyle.textTheme.bodyMedium!
                      .copyWith(color: AppStyle.darkPrimaryColor),
                ),
              ))
          .toList(),
      child: Container(
        padding: EdgeInsets.all(4.r),
        decoration: const BoxDecoration(
          color: AppStyle.blue,
          borderRadius: AppStyle.borderRadius,
        ),
        child: Icon(
          Icons.sort,
          color: AppStyle.white,
          size: 24.r,
        ),
      ),
    );
  }
}
