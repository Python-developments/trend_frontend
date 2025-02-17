import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trend/core/controllers/controllers_mixins/form_mixin.dart';
import 'package:trend/core/presentation/validators/custom_validator.dart';
import 'package:trend/core/presentation/widgets/text_fields/custom_text_field.dart';
import 'package:trend/core/utils/enums.dart';

class FormControllerTextField extends StatelessWidget {
  final String title, fieldKey, errorKey;
  final String? hint;
  final bool isObscureText, readOnly, isNeedToAutoFill;
  final Widget? suffixIcon, prefixIcon;
  final TextInputType? textInputType;
  final FieldPriority priority;
  final TextInputFormatter? inputFormatter;
  final CustomValidator? validator;
  final FormMixin formController;
  final int maxLines;

  const FormControllerTextField({
    required this.title,
    required this.validator,
    required this.formController,
    required this.fieldKey,
    required this.errorKey,
    super.key,
    this.isObscureText = false,
    this.suffixIcon,
    this.hint,
    this.readOnly = false,
    this.maxLines = 1,
    this.prefixIcon,
    this.textInputType,
    this.inputFormatter,
    this.isNeedToAutoFill = false,
    this.priority = FieldPriority.required,
  });

  @override
  Widget build(final BuildContext context) {
    return Observer(
        builder: (final _) => CustomTextField(
              title: title,
              textController: formController.getFieldTextController(fieldKey),
              error: formController.validationErrors[errorKey],
              validator: validator,
              maxLines: maxLines,
              onSubmit: (final _) =>
                  FocusManager.instance.primaryFocus?.unfocus(),
              fieldPriority: priority,
              inputFormatter: inputFormatter,
              readOnly: readOnly,
              isObscureText: isObscureText,
              prefixIcon: prefixIcon,
              suffixIcon: suffixIcon,
              textInputType: textInputType,
              hint: hint,
              isNeedToAutoFill: isNeedToAutoFill,
            ));
  }
}
