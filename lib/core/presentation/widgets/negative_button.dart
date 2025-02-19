import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';

class NegativeButton extends StatefulWidget {
  final String title;
  final void Function() onPressed;
  final IconData? icon;
  const NegativeButton({
    required this.title,
    required this.onPressed,
    this.icon,
    super.key,
  });

  @override
  State<NegativeButton> createState() => _NegativeButtonState();
}

class _NegativeButtonState extends State<NegativeButton> {
  bool isLongPressed = false;
  @override
  Widget build(final BuildContext context) {
    return Container(
        constraints: BoxConstraints(
          minWidth: 100.w /*-(isLongPressed?8.r:0)*/,
          minHeight: 40.h /*-(isLongPressed?4.r:0)*/,
          maxHeight: 40.h /*-(isLongPressed?4.r:0)*/,
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 50),
          decoration: BoxDecoration(
              border: Border.all(color: AppStyle.errorColor),
              borderRadius: AppStyle.borderRadius),
          margin: EdgeInsets.all(isLongPressed ? 2.r : 0),
          child: Material(
            color: AppStyle.white,
            shape: const RoundedRectangleBorder(borderRadius: AppStyle.borderRadius),
            child: InkWell(
              splashColor: AppStyle.black.shade100,
              customBorder:
                  const RoundedRectangleBorder(borderRadius: AppStyle.borderRadius),
              onTap: widget.onPressed,
              onTapDown: (final _) => setState(() => isLongPressed = true),
              onTapUp: (final _) => setState(() => isLongPressed = false),
              onTapCancel: () => setState(() => isLongPressed = false),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (widget.icon != null) ...[
                    Icon(
                      widget.icon,
                      size: 40.r,
                      color: AppStyle.white,
                    ),
                    const CustomSizedBox(
                      width: 4,
                    ),
                  ],
                  Text(
                    widget.title,
                    style: AppStyle.textTheme.bodyMedium!.copyWith(
                        color: AppStyle.errorColor,
                        fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}
