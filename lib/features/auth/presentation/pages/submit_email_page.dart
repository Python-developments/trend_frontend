import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/arguments/submit_receiver_page_arguments.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/core/presentation/widgets/custom_app_bar.dart';
import 'package:trend/core/presentation/widgets/main_button.dart';
import 'package:trend/core/presentation/widgets/secondary_button.dart';
import 'package:trend/core/presentation/widgets/text_fields/email_text_field.dart';
import 'package:trend/dependencies.dart';
import 'package:trend/features/auth/controllers/submit_receiver_controller.dart';

@RoutePage()
class SubmitEmailPage extends StatefulWidget {
  final SubmitReceiverPageArguments args;
  const SubmitEmailPage({required this.args, super.key});

  @override
  State<SubmitEmailPage> createState() => _SubmitEmailPageState();
}

class _SubmitEmailPageState extends State<SubmitEmailPage> {
  late SubmitReceiverController controller;
  @override
  void initState() {
    controller = getIt<SubmitReceiverController>(param1: widget.args);
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return Form(
      key: controller.formKey,
      child: Scaffold(
          backgroundColor: Colors.white,
          appBar: CustomAppBar(
            
            context: context,
            barTitle: 'Enter your email',
          ),
          body: Observer(
            builder: (final _) => Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            SizedBox(height: 200.h),
                            Text(
                              'Reset Password',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 24.sp,
                              ),
                            ),
                            SizedBox(height: 40.h),
                            EmailTextField(
                              formController: controller,
                            ),
                            SizedBox(height: 30.h),
                            Center(
                              child: MainButton(
                                title: 'Send Reset Link',
                                isLoading: controller.isLoading,
                                onPressed:controller.submitForm
                              ),
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                    ),
                      Center(
                        child: SecondaryButton(
                          onPressed: getAppRouter.maybePop,
                          title: 'Back to Login',
                          ),
                      ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          )),
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
