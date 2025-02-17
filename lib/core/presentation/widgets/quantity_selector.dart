import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/widgets/custom_svg_image.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/assets.dart';
import 'package:trend/core/presentation/widgets/animated_quantity_widget.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';

class QuantitySelector extends StatefulWidget {
  final int quantity;
  final double size;
  final bool isDisabled;
  final void Function() onTapIncrease, onTapDecrease;

  const QuantitySelector({
    required this.quantity,
    required this.size,
    required this.onTapDecrease,
    required this.onTapIncrease,
    required this.isDisabled,
    super.key,
  });

  @override
  State<QuantitySelector> createState() => _QuantitySelectorState();
}

class _QuantitySelectorState extends State<QuantitySelector> {
  late ValueNotifier<int> quantityNotifier;

  @override
  void initState() {
    super.initState();
    quantityNotifier = ValueNotifier(widget.quantity);
  }

  @override
  Widget build(final BuildContext context) {
    return Row(children: [
      GestureDetector(
          onTap: () {
            if (widget.isDisabled) {
              return;
            }
            quantityNotifier.value = max(1, quantityNotifier.value - 1);
            widget.onTapDecrease();
          },
          child: Container(
              padding: widget.quantity == 1 ? EdgeInsets.all(4.r) : null,
              height: widget.size.r,
              width: widget.size.r,
              decoration: BoxDecoration(
                border: Border.all(color: AppStyle.darkPrimaryColor),
                borderRadius: AppStyle.borderRadius,
              ),
              child: CustomSvgImage(
                  path: widget.quantity == 1 ? Assets.delete : Assets.minus,
                  size: 24,
                  color: AppStyle.darkPrimaryColor))),
      const CustomSizedBox(
        width: 2,
      ),
      AnimatedQuantityWidget(
        quantityNotifier: quantityNotifier,
        size: widget.size,
      ),
      const CustomSizedBox(
        width: 2,
      ),
      GestureDetector(
          onTap: () {
            if (widget.isDisabled) {
              return;
            }
            quantityNotifier.value++;
            widget.onTapIncrease();
          },
          child: Container(
            height: widget.size.r,
            width: widget.size.r,
            decoration: BoxDecoration(
              border: Border.all(color: AppStyle.darkPrimaryColor),
              borderRadius: AppStyle.borderRadius,
            ),
            child: const CustomSvgImage(
                path: Assets.plus, color: AppStyle.darkPrimaryColor),
          )),
    ]);
  }

  @override
  void dispose() {
    quantityNotifier.dispose();
    super.dispose();
  }
}
