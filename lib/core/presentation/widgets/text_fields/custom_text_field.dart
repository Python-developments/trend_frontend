import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/validators/custom_validator.dart';
import 'package:trend/core/presentation/validators/is_not_empty_validator.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/core/utils/extensions.dart';

class CustomTextField extends StatelessWidget {
  final String? title;
  final String? error, hint;
  final bool isObscureText, readOnly, isNeedToAutoFill;
  final Widget? suffixIcon, prefixIcon;
  final TextInputType? textInputType;
  final FieldPriority fieldPriority;
  final void Function(String)? onSubmit;
  final TextInputFormatter? inputFormatter;
  final CustomValidator? validator;
  final TextEditingController? textController;
  final double? height;
  final Color? fieldColor;
  final int maxLines;
  final FocusNode? focusNode;
  const CustomTextField({
    required this.title,
    required this.validator,
    required this.textController,
    this.onSubmit,
    super.key,
    this.isObscureText = false,
    this.suffixIcon,
    this.readOnly = false,
    this.maxLines = 1,
    this.prefixIcon,
    this.textInputType,
    this.inputFormatter,
    this.hint,
    this.focusNode,
    this.fieldPriority = FieldPriority.required,
    this.error,
    this.height,
    this.fieldColor,
    this.isNeedToAutoFill = false,
  }) : assert(!((textController == null) && (!readOnly)));

  @override
  Widget build(final BuildContext context) {
    return SizedBox(
      height: height,
      child: TextFormField(
        focusNode: focusNode,
        textInputAction: TextInputAction.done,
        enabled: !readOnly,
        controller: textController,
        obscureText: isObscureText,
        keyboardType: textInputType,
        maxLines: maxLines,
        maxLength: maxLines > 2 ? 100 : null,
        autofillHints: isNeedToAutoFill ? [AutofillHints.oneTimeCode] : null,
        validator: (final value) => title == null
            ? null
            : (value?.isEmpty ?? true) &&
                    (fieldPriority != FieldPriority.required)
                ? null
                : validator != null
                    ? validator!.check(fieldName: title!, toCheckString: value)
                    : IsNotEmptyValidator()
                        .check(fieldName: title!, toCheckString: value),
        cursorColor: AppStyle.blue,
        inputFormatters: [
          if (inputFormatter != null) inputFormatter!,
        ],
        onFieldSubmitted: onSubmit,
        decoration: InputDecoration(
          errorText: error,
          suffixIcon: suffixIcon != null
              ? Center(
                  child: suffixIcon!,
                )
              : Container(),
          fillColor: fieldColor ?? AppStyle.black.shade100,
          filled: true,
          prefixIcon: prefixIcon,
          alignLabelWithHint: true,
          isDense: true,
          border: const OutlineInputBorder(
            borderRadius: AppStyle.borderRadius,
            borderSide: BorderSide.none,
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
          hintText: hint?,
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
          label: title != null
              ? RichText(
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  text: TextSpan(
                      text: title!,
                      style: AppStyle.textTheme.bodyMedium!
                          .copyWith(color: AppStyle.black.shade600),
                      children: [
                        TextSpan(
                          text: fieldPriority == FieldPriority.optional
                              ? ' (${fieldPriority.name})'
                              : '',
                          style: AppStyle.textTheme.bodySmall!
                              .copyWith(color: AppStyle.errorColor),
                        )
                      ]),
                )
              : null,
        ),
      ),
    );
  }
}
