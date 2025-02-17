import 'package:flutter/material.dart';
import 'package:trend/core/controllers/controllers_mixins/form_mixin.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/validators/custom_validator.dart';
import 'package:trend/core/presentation/widgets/text_fields/form_controller_text_field.dart';
import 'package:trend/core/utils/enums.dart';

class LongTextField extends StatelessWidget {
  final String title, fieldKey, errorKey;
  final FormMixin formController;
  final CustomValidator? validator;
  final FieldPriority priority;
  final int lines;
  const LongTextField(
      {required this.formController,
      required this.title,
      required this.fieldKey,
      required this.errorKey,
      this.lines = 3,
      super.key,
      this.priority = FieldPriority.required,
      this.validator});

  @override
  Widget build(final BuildContext context) {
    return FormControllerTextField(
      title: title,
      validator: validator,
      maxLines: lines,
      formController: formController,
      fieldKey: fieldKey,
      errorKey: errorKey,
      priority: priority,
      prefixIcon: const Icon(
        Icons.edit_note,
        color: AppStyle.lightPrimaryColor,
      ),
    );
  }
}
