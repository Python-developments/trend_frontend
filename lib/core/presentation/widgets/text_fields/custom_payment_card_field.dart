import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:trend/core/presentation/app_style.dart';

class CustomPaymentCardField extends StatefulWidget {
  final void Function(CardFieldInputDetails) onDetailsChanged;
  const CustomPaymentCardField({required this.onDetailsChanged, super.key});

  @override
  State<CustomPaymentCardField> createState() => _CustomPaymentCardFieldState();
}

class _CustomPaymentCardFieldState extends State<CustomPaymentCardField> {

  late CardEditController controller;

  @override
  void initState() {
    super.initState();
    controller = CardEditController()
      ..addListener(() {
        widget.onDetailsChanged(controller.details);
      });
  }

  @override
  Widget build(final BuildContext context) {
    return CardField(
      controller: controller,
      enablePostalCode: false,
      countryCode: 'UAE',
      style: AppStyle.textTheme.bodyMedium,
      cursorColor: AppStyle.blue,
      androidPlatformViewRenderType:
      AndroidPlatformViewRenderType.androidView,
      decoration: InputDecoration(
        filled: true,
        alignLabelWithHint: true,
        isDense: true,
        border: const OutlineInputBorder(
          borderRadius: AppStyle.borderRadius,
          borderSide: BorderSide(color: AppStyle.blue),
        ),
        enabledBorder: const OutlineInputBorder(
          borderRadius: AppStyle.borderRadius,
          borderSide: BorderSide(color: AppStyle.blue),
        ),
        focusedBorder: const OutlineInputBorder(
          borderRadius: AppStyle.borderRadius,
          borderSide: BorderSide(color: AppStyle.blue),
        ),
        errorBorder: const OutlineInputBorder(
          borderRadius: AppStyle.borderRadius,
          borderSide: BorderSide(color: AppStyle.errorColor),
        ),
        focusedErrorBorder: const OutlineInputBorder(
          borderRadius: AppStyle.borderRadius,
          borderSide: BorderSide(color: AppStyle.errorColor),
        ),
        hintStyle: AppStyle.textTheme.bodySmall!
            .copyWith(color: AppStyle.black.shade600),
        prefixIconConstraints: BoxConstraints(
          minWidth: 48.r,
          maxWidth: 48.r,
        ),
        suffixIconConstraints: BoxConstraints(
          minWidth: 48.r,
          maxWidth: 48.r,
        ),
      ),
    );
  }
  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
