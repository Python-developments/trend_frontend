import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trend/core/controllers/controllers_mixins/form_mixin.dart';
import 'package:trend/core/presentation/validators/is_not_empty_validator.dart';
import 'package:trend/core/presentation/widgets/text_fields/form_controller_text_field.dart';
import 'package:trend/core/utils/masked_formatter.dart';

class CustomOtpTextField extends StatelessWidget {
  final FormMixin formController;

  const CustomOtpTextField({
    required this.formController,
    super.key,
  });


  @override
  Widget build(final BuildContext context) {
    return FormControllerTextField(
      title: 'Verify otp',
      inputFormatter: MaskedInputFormatter(
        '000000',
      ),
      formController: formController,
      fieldKey: 'otpCode',
      errorKey: 'otp',
      validator: IsNotEmptyValidator(),
      isNeedToAutoFill: false,
    );
  }

}
