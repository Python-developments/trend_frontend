import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/utils/extensions.dart';

class MainButton extends StatefulWidget {
  final String title;
  final double? width;
  final void Function() onPressed;
  final bool isLoading, isDisabled;
  final IconData? icon;

  const MainButton(
      {required this.title,
      required this.isLoading,
      required this.onPressed,
      this.isDisabled = false,
      this.width,
      this.icon,
      super.key});

  factory MainButton.wide({
    required final String title,
    required final bool isLoading,
    required final void Function() onPressed,
    final bool isDisabled = false,
  }) =>
      MainButton(
        title: title,
        isLoading: isLoading,
        onPressed: onPressed,
        width: 282,
        isDisabled: isDisabled,
      );

  @override
  State<MainButton> createState() => _MainButtonState();
}

class _MainButtonState extends State<MainButton> {
  bool isLongPressed = false;

  @override
  Widget build(final BuildContext context) {
    return FittedBox(
      child: Container(
        constraints: BoxConstraints(
          minWidth: (widget.width ?? 100).w /*-(isLongPressed?8.r:0)*/,
          minHeight: 40.h /*-(isLongPressed?4.r:0)*/,
          maxHeight: 40.h /*-(isLongPressed?4.r:0)*/,
        ),
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 50),
          margin: EdgeInsets.all(isLongPressed ? 2.r : 0),
          child: Material(
            color: Colors.white,
            shape: const RoundedRectangleBorder(borderRadius: AppStyle.borderRadius),
            child: InkWell(
              customBorder:
                  const RoundedRectangleBorder(borderRadius: AppStyle.borderRadius),
              onTap: !(widget.isLoading || widget.isDisabled)
                  ? () {
                      FocusManager.instance.primaryFocus?.unfocus();
                      widget.onPressed();
                    }
                  : null,
              onTapDown: (final _) => !(widget.isLoading || widget.isDisabled)
                  ? setState(() => isLongPressed = true)
                  : {},
              onTapUp: (final _) => !(widget.isLoading || widget.isDisabled)
                  ? setState(() => isLongPressed = false)
                  : {},
              onTapCancel: () => !(widget.isLoading || widget.isDisabled)
                  ? setState(() => isLongPressed = false)
                  : {},
              child: Ink(
                decoration: BoxDecoration(
                    color: widget.isDisabled ? AppStyle.black.shade300 : AppStyle.blue,
                    borderRadius: AppStyle.borderRadius),
                child: Padding(
                  padding: EdgeInsets.all(4.r),
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 500),
                    child: widget.isLoading
                        ? const CircularProgressIndicator(
                            color: AppStyle.white,
                          )
                        : Center(
                            child: Padding(
                            padding: EdgeInsets.all(4.r),
                            child: Text(
                              widget.title,
                              style: AppStyle.textTheme.bodyMedium!.copyWith(
                                  color: AppStyle.white,
                                  fontWeight: FontWeight.bold),
                            ),
                          )),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
