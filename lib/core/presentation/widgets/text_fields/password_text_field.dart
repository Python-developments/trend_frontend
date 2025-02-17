import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/widgets/custom_svg_image.dart';
import 'package:trend/core/controllers/controllers_mixins/form_mixin.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/assets.dart';
import 'package:trend/core/presentation/validators/is_not_empty_validator.dart';
import 'package:trend/core/presentation/widgets/text_fields/form_controller_text_field.dart';

class PasswordTextField extends StatefulWidget {
  final FormMixin formController;
  final String title, fieldKey, errorKey;
  const PasswordTextField(
      {required this.formController,
      this.fieldKey = 'password',
      super.key,
      this.title = 'Password',
      this.errorKey = 'password'});

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool isObscurePassword = true;

  void toggleObscurePassword() {
    setState(() {
      isObscurePassword = !isObscurePassword;
    });
  }

  @override
  Widget build(final BuildContext context) {
    return FormControllerTextField(
      fieldKey: widget.fieldKey,
      formController: widget.formController,
      validator: IsNotEmptyValidator(),
      title: widget.title,
      errorKey: widget.errorKey,
      isObscureText: isObscurePassword,
      suffixIcon: GestureDetector(
          onTap: toggleObscurePassword,
          child: Icon(
              isObscurePassword
                  ? Icons.remove_red_eye
                  : Icons.remove_red_eye_outlined,
              size: 24.r,
              color: AppStyle.black.shade300)),
      prefixIcon: const CustomSvgImage(path: Assets.lock, size: 16),
    );
  }
}
