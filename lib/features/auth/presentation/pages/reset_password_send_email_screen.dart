import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/features/auth/presentation/manager/auth_bloc.dart';
import 'package:trend/features/auth/presentation/manager/auth_state.dart';
import 'package:trend/features/auth/presentation/widgets/customer_button.dart';
import 'package:trend/features/auth/presentation/widgets/customer_text_form.dart';
import 'package:trend/shared/const/colors.dart';

import '../../../../../shared/style/app_styles.dart';
import '../../../../../shared/utiles/routes.dart';
import '../manager/auth_event.dart';

class ResetPasswordSendEmailScreen extends StatelessWidget {
  ResetPasswordSendEmailScreen({super.key});

  final TextEditingController _emailController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _validateAndLogin(BuildContext context) {
    ScaffoldMessenger.of(context)
        .hideCurrentSnackBar(); // Clear previous SnackBars
    if (_formKey.currentState!.validate()) {
      context
          .read<AuthBloc>()
          .add(RestPasswordSendEmailEvent(email: '${_emailController.text}'));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please enter a valid Email')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    return Scaffold(
        backgroundColor: Color(AppColors.white),
        body: BlocConsumer<AuthBloc, AuthState>(
          buildWhen: (previous, current) => previous != current,
          listener: (context, state) {
            ScaffoldMessenger.of(context)
                .hideCurrentSnackBar(); // Clear previous SnackBars
            if (state is RestPasswordSendEmail) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                    content: Text('OTP has been sent to your email address.')),
              );
              Navigator.pushReplacementNamed(
                    context,
                    AppRoutes.resetPasswordConfirmOtp,
                    arguments: state.message,
                  );
            } else if (state is AuthError) {
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
                              Text('Reset Password',
                                  textAlign: TextAlign.center,
                                  style: AppStyles.styleSemiBold25(context)),
                              SizedBox(height: 30),
                              Text(
                                  'Enter your email address and we will send you a otp to reset your password',
                                  textAlign: TextAlign.center,
                                  style: AppStyles.styleNormal13(context)
                                      .copyWith(
                                          color: Color(AppColors.greyDark))),
                              SizedBox(height: 60.h),
                              CustomerTextForm(
                                name: 'Email Address',
                                isPassword: false,
                                controller: _emailController,
                                onFieldSubmitted: () {
                                  _validateAndLogin(context);
                                },
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email ';
                                  }
                                  return null;
                                },
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
                                  onPressed: () => _validateAndLogin(context),
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
        ));
  }
}
