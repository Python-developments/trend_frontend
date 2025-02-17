import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/widgets/custom_action_chip.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';
import 'package:trend/core/utils/enums.dart';

class CustomChipsWrapper<T> extends StatelessWidget {
  final String title;
  final List<T> chips;
  final List<T> selectedChips;
  final List<T> disabledChips;
  final void Function(T) onPressChip;
  final String Function(T) titleGetter;
  const CustomChipsWrapper(
      {required this.selectedChips,
      required this.titleGetter,
      required this.title,
      required this.chips,
      required this.onPressChip,
      required this.disabledChips,
      super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text(
        title,
        style: AppStyle.textTheme.bodyLarge!
            .copyWith(color: AppStyle.black.shade900),
      ),
      const CustomSizedBox(
        height: 4,
      ),
      Wrap(spacing: 8.w, runSpacing: 8.w, children: [
        for (int i = 0; i < chips.length; i++) ...[
          CustomActionChip(
               width: (chips.fold<int>(0,(final previousValue,final chip) =>
        max(previousValue,titleGetter(chip).length)) *10).w,
              title: titleGetter(chips[i]),
              onPressed: () => onPressChip(chips[i]),
              chipState: selectedChips.contains(chips[i])? ChipState.selected:
              disabledChips.contains(chips[i])? ChipState.disabled: ChipState.unselected
          )
        ]
      ])
    ]);
  }
}
