import 'package:flutter/material.dart';
import 'package:trend/core/presentation/widgets/custom_svg_image.dart';
import 'package:trend/core/controllers/controllers_mixins/form_mixin.dart';
import 'package:trend/core/presentation/assets.dart';
import 'package:trend/core/presentation/validators/is_not_empty_validator.dart';
import 'package:trend/core/presentation/widgets/text_fields/form_controller_text_field.dart';

class EmailTextField extends StatelessWidget {
  final FormMixin formController;
  final String title, errorKey, fieldKey;
  const EmailTextField(
      {required this.formController,
      super.key,
      this.title = 'Email',
      this.fieldKey = 'email',
      this.errorKey = 'email'});

  @override
  Widget build(final BuildContext context) {
    return FormControllerTextField(
      fieldKey: fieldKey,
      errorKey: errorKey,
      formController: formController,
      validator: IsNotEmptyValidator(),
      title: title,
      textInputType: TextInputType.emailAddress,
      prefixIcon: const CustomSvgImage(path: Assets.email, size: 16),
    );
  }
}
