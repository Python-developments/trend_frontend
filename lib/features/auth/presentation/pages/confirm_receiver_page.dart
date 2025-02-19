/*
import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/arguments/confirm_otp_page_arguments.dart';
import 'package:trend/core/presentation/widgets/custom_animated_fade_in_column.dart';
import 'package:trend/core/presentation/widgets/custom_app_bar.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';
import 'package:trend/core/presentation/widgets/main_button.dart';
import 'package:trend/core/presentation/widgets/text_fields/custom_otp_text_field.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/core/utils/extensions.dart';
import 'package:trend/dependencies.dart';
import 'package:trend/features/auth/controllers/confirm_otp_controller.dart';

@RoutePage()
class ConfirmReceiverPage extends StatefulWidget {
  final ConfirmReceiverPageArguments args;
  const ConfirmReceiverPage({required this.args, super.key});

  @override
  State<StatefulWidget> createState() => _ConfirmReceiverPageState();
}

class _ConfirmReceiverPageState extends State<ConfirmReceiverPage> {
  late ConfirmOtpController controller;

  @override
  void initState() {
    controller = getIt<ConfirmOtpController>(param1: widget.args);
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return Form(
        key: controller.formKey,
        child: Scaffold(
          appBar: CustomAppBar(
            context: context,
            barTitle: '',
            
          ),
          body: Observer(
              builder: (final _) => Padding(
                    padding: EdgeInsets.all(16.r),
                    child: CustomAnimatedFadeInColumn(
                      children: [
                        Text(
                          'Verify Account',
                          style: AppStyle.textTheme.titleLarge!.copyWith(
                            color: AppStyle.black.shade900,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const CustomSizedBox(
                          height: 64,
                        ),
                        Text(
                          'We sent you a verification code from 6 letters , please use it to confirm your account'
                              ,
                          style: AppStyle.textTheme.bodyMedium!
                              .copyWith(color: AppStyle.black.shade400),
                          textAlign: TextAlign.center,
                        ),
                        const CustomSizedBox(
                          height: 8,
                        ),
                        if (widget.args.verificationType ==
                            OtpVerificationType.email)
                          Text(
                            'also check your spam folder if you cant see the email'
                                ,
                            style: AppStyle.textTheme.bodyMedium!
                                .copyWith(color: AppStyle.black.shade400),
                            textAlign: TextAlign.center,
                          ),
                        const CustomSizedBox(
                          height: 32,
                        ),
                        CustomOtpTextField(
                          formController: controller,
                        ),
                        const CustomSizedBox(
                          height: 16,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            if (controller.resendSecondsCounter > 0) ...[
                              Text(
                                '00:${controller.resendSecondsCounter > 10 ? '' : '0'}${controller.resendSecondsCounter}',
                                style: AppStyle.textTheme.bodySmall!
                                    .copyWith(color: AppStyle.black.shade400),
                              ),
                              const CustomSizedBox(
                                width: 8,
                              ),
                            ],
                            GestureDetector(
                              onTap: controller.resendCode,
                              child: Text('Resend',
                                  style: AppStyle.textTheme.bodyMedium!
                                      .copyWith(
                                          color: controller
                                                      .resendSecondsCounter >
                                                  0
                                              ? AppStyle.black.shade400
                                              : AppStyle.lightPrimaryColor)),
                            ),
                          ],
                        ),
                        const Spacer(),
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
                  )),
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
*/
