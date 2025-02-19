import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/arguments/submit_new_password_arguments.dart';
import 'package:trend/core/presentation/widgets/custom_animated_fade_in_column.dart';
import 'package:trend/core/presentation/widgets/custom_app_bar.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';
import 'package:trend/core/presentation/widgets/main_button.dart';
import 'package:trend/core/presentation/widgets/text_fields/password_text_field.dart';
import 'package:trend/dependencies.dart';
import 'package:trend/features/auth/controllers/submit_new_password_controller.dart';

@RoutePage()
class SubmitNewPasswordPage extends StatefulWidget {
  final SubmitNewPasswordArguments args;
  const SubmitNewPasswordPage({required this.args, super.key});

  @override
  State<SubmitNewPasswordPage> createState() => _SubmitNewPasswordPageState();
}

class _SubmitNewPasswordPageState extends State<SubmitNewPasswordPage> {
  late SubmitNewPasswordController controller;

  @override
  void initState() {
    controller = getIt<SubmitNewPasswordController>(param1: widget.args);
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return Form(
        key: controller.formKey,
        child: Observer(
            builder: (final _) => Scaffold(
                  appBar: CustomAppBar(
                    
                    context: context,
                    barTitle: '',
                  ),
                  body: SingleChildScrollView(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: CustomAnimatedFadeInColumn(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CustomSizedBox(
                            height: 48,
                          ),
                          Text(
                            'Set Your Password',
                            style: AppStyle.textTheme.headlineSmall!
                                .copyWith(color: AppStyle.black.shade900),
                          ),

                          const CustomSizedBox(
                            height: 48,
                          ),
                          if (widget.args.isRequiresOldPassword) ...[
                            PasswordTextField(
                                title: 'Old password',
                                formController: controller,
                                fieldKey: 'oldPassword',
                                errorKey: 'oldPassword'),
                            const CustomSizedBox(
                              height: 16,
                            ),
                          ],
                          PasswordTextField(
                              formController: controller,
                              fieldKey: 'newPassword',
                              title: 'New password',
                              errorKey: 'newPassword'),
                          const CustomSizedBox(
                            height: 16,
                          ),
                          PasswordTextField(
                              fieldKey: 'confirmPassword',
                              title: 'Confirm password',
                              formController: controller,
                              errorKey: 'confirmPassword'),
                        ]),
                  ),
                  bottomNavigationBar: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Center(
                        child: MainButton.wide(
                            title: 'Submit',
                            isLoading: controller.isLoading,
                            onPressed: controller.submitForm),
                      ),
                      const CustomSizedBox(
                        height: 32,
                      ),
                    ],
                  ),
                )));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
