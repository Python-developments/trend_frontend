import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'package:trend/core/controllers/controllers_mixins/form_mixin.dart';
import 'package:trend/core/presentation/validators/is_not_empty_validator.dart';
import 'package:trend/core/presentation/widgets/text_fields/form_controller_text_field.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/core/utils/masked_formatter.dart';

class CustomOtpTextField extends StatefulWidget {
  final FormMixin formController;
  final OtpVerificationType verificationType;

  const CustomOtpTextField({
    required this.formController,
    required this.verificationType,
    super.key,
  });

  @override
  State<CustomOtpTextField> createState() => _CustomOtpTextFieldState();
}

class _CustomOtpTextFieldState extends State<CustomOtpTextField>
    with CodeAutoFill {
  @override
  void codeUpdated() {
    widget.formController.setValue('otpCode', code);
    widget.formController.submitForm();
  }

  @override
  void initState() {
    super.initState();
    if (widget.verificationType == OtpVerificationType.phone) {
      listenForCode();
    }
  }

  @override
  Widget build(final BuildContext context) {
    return FormControllerTextField(
      title: 'Verify otp',
      inputFormatter: MaskedInputFormatter(
        '000000',
      ),
      formController: widget.formController,
      fieldKey: 'otpCode',
      errorKey: 'otp',
      validator: IsNotEmptyValidator(),
      isNeedToAutoFill: widget.verificationType == OtpVerificationType.phone,
    );
  }

  @override
  void dispose() {
    if (widget.verificationType == OtpVerificationType.phone) {
      cancel();
    }
    unregisterListener();
    super.dispose();
  }
}
