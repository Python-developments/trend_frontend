import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/controllers/text_field_dialog_controller.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/validators/custom_validator.dart';
import 'package:trend/core/presentation/widgets/close_widget.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';
import 'package:trend/core/presentation/widgets/main_button.dart';
import 'package:trend/core/presentation/widgets/text_fields/form_controller_text_field.dart';
import 'package:trend/dependencies.dart';

class CustomTextFieldDialog extends StatefulWidget {
  final String title, mainActionText, textFieldTitle, dialogTextContent;

  final CustomValidator textFieldValidator;
  final bool isDismissable;

  final void Function(String) onMainActionPressed;

  const CustomTextFieldDialog({
    required this.title,
    required this.mainActionText,
    required this.onMainActionPressed,
    required this.textFieldTitle,
    required this.dialogTextContent,
    required this.textFieldValidator,
    super.key,
    this.isDismissable = true,
  });

  @override
  State<CustomTextFieldDialog> createState() => _CustomTextFieldDialogState();
}

class _CustomTextFieldDialogState extends State<CustomTextFieldDialog> {
  late TextFieldDialogController controller;

  @override
  void initState() {
    controller =
        getIt<TextFieldDialogController>(param1: widget.onMainActionPressed);
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return Form(
      key: controller.formKey,
      child: AlertDialog(
          titlePadding: EdgeInsets.all(16.h),
          contentPadding: EdgeInsets.all(8.h),
          actionsPadding: EdgeInsets.all(8.h),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15),
          ),
          surfaceTintColor: Colors.transparent,
          backgroundColor: AppStyle.white,
          title: Row(
            children: [
              Text(
                widget.title,
                style: AppStyle.textTheme.titleSmall!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              const Spacer(),
              if (widget.isDismissable) const CloseWidget(),
            ],
          ),
          content: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const CustomSizedBox(
                height: 8,
              ),
              Text(
                widget.dialogTextContent,
                style: AppStyle.textTheme.bodyMedium!.copyWith(
                    color: AppStyle.black.shade800,
                    fontWeight: FontWeight.bold),
              ),
              const CustomSizedBox(
                height: 8,
              ),
              FormControllerTextField(
                errorKey: '',
                validator: widget.textFieldValidator,
                title: widget.textFieldTitle,
                formController: controller,
                fieldKey: 'textField',
              ),
            ],
          ),
          actions: [
            Center(
              child: MainButton(
                  isLoading: false,
                  title: widget.mainActionText,
                  onPressed: controller.submitForm),
            )
          ]),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
