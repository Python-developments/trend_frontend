import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/features/auth/presentation/manager/auth_bloc.dart';
import 'package:trend/features/auth/presentation/manager/auth_state.dart';
import 'package:trend/features/authentication/presentation/widgets/custom_button.dart';
import 'package:trend/shared/const/colors.dart';

import '../../../../shared/style/app_styles.dart';
import '../../../../shared/utiles/routes.dart';
import '../manager/auth_event.dart';
import '../widgets/otp_text_form.dart';




class ResetPasswordConfirmEmilScreen extends StatelessWidget {
  ResetPasswordConfirmEmilScreen({super.key});

  final TextEditingController _OtpController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();


  void _validateAndLogin(BuildContext context,String restToken) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Clear previous SnackBars
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(RestPasswordVerifyOtpEvent(restToken: restToken , otp: _OtpController.text.trim()));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fix the errors')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    final String? refreshToken = ModalRoute.of(context)?.settings.arguments as String?;
    return Scaffold(
        backgroundColor: Color(AppColors.white),
        body: BlocConsumer<AuthBloc, AuthState>(
          buildWhen: (previous,current) => previous!= current,
          listener: (context, state) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Clear previous SnackBars
            if (state is RestPasswordVerifyOtp) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text(
                        '${state.message}')),
              );
              Future.microtask(() => Navigator.pushReplacementNamed(
                context,
                AppRoutes.resetPasswordFinish,
                arguments:refreshToken,
              ));
            } 
            else if (state is AuthError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${state.message}')),
              );
            }
          },
          builder: (context, state) {
            return Center(
              child: SizedBox(
                width: 280.w,
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Expanded(
                        child: SingleChildScrollView(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(height: 120.h),
                              Text('Otp Verification',
                                  textAlign: TextAlign.center,
                                  style: AppStyles.styleSemiBold25(
                                      context)),
                              SizedBox(height: 30),
                              Text(
                                  'Enter your OTP sent to your email to reset your password',
                                  textAlign: TextAlign.center,
                                  style:
                                  AppStyles.styleNormal13(context)
                                      .copyWith(
                                      color: Color(
                                          AppColors.greyDark))),
                              SizedBox(height: 60.h),
                              OtpInputField(
                                onCompleted: (){
                                  _validateAndLogin(context, refreshToken??"");
                                },
                                otpController: _OtpController,
                              ),
                              SizedBox(height: 40),
                              Visibility(
                                  visible: state is AuthLoading,
                                  child: Center(
                                      child: CircularProgressIndicator(
                                        color: Color(AppColors.black),
                                      ))),
                              Visibility(
                                visible: !(state is AuthLoading),
                                child: CustomButton(
                                  text: 'Reset Password',
                                  onPressed: () =>
                                      _validateAndLogin(context, refreshToken??""),
                                ),
                              ),
                              SizedBox(height: 20.h),
                            ],
                          ),
                        ),
                      ),
                      if (!isKeyboardOpen)
                        Align(
                          alignment: Alignment.center,
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Back to Login',
                              style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      if (!isKeyboardOpen) SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            );
          },
        )
    );
  }
}
