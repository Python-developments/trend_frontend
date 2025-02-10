import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/features/auth/presentation/manager/auth_bloc.dart';
import 'package:trend/features/auth/presentation/manager/auth_state.dart';
import 'package:trend/shared/const/colors.dart';
import 'package:trend/shared/style/app_styles.dart';
import 'package:trend/shared/utiles/routes.dart';

import '../../../../shared/core/local/SharedPreferencesDemo.dart';
import '../../../authentication/presentation/widgets/custom_button.dart';
import '../../data/models/local/verify_otp_local.dart';
import '../manager/auth_event.dart';
import '../widgets/otp_text_form.dart';


class OtpConfirmScreen extends StatelessWidget {
  OtpConfirmScreen({super.key});
  

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _otpController =
      TextEditingController();

  void _otpConfirm(BuildContext context) async{
    final emailUser = await SharedPreferencesDemo.loadUserData().email;
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(OptConfirmEvent(
          verifyOtpModel:
              VerifyOtpLocal(
                  email: emailUser ??"",
                  otp: _otpController.text)));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fix the errors')),
      );
    }
  }

  void _otpResend(BuildContext context) async{
    final emailUser = await SharedPreferencesDemo.loadUserData().email;
      context.read<AuthBloc>().add(OptResendEvent(email: emailUser));
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;
    return Scaffold(
      backgroundColor: Color(AppColors.white),
      body: BlocConsumer<AuthBloc, AuthState>(
        listener: (BuildContext context, state) {
          if (state is AuthOptSent) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${state.message}!')),
            );
          } else if (state is AuthOptConfirmed) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content:
                      Text('Welcome, ${state.verifyOtp.message}!')),
            );
            Navigator.pushNamed(context, AppRoutes.login);
          } else if (state is AuthError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text('${state.message}')),
            );
          }
        },
        builder: (context, state) {
          return SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      SizedBox(height: 40.h),
                      Center(
                        child: Text('T  R  E  N  D',
                            style: AppStyles.styleBold30(context)),
                      ),
                      SizedBox(height: 50.h),
                      Text('Enter the OTP sent to your email',
                          style: AppStyles.styleNormal13(context)
                              .copyWith(
                                  color: Color(AppColors.greyDark))),
                      const SizedBox(height: 20),
                      OtpInputField(
                        onCompleted: (){
                          _otpConfirm(context);
                        },
                        otpController: _otpController,
                      ),
                      const SizedBox(height: 30),
                      CustomButton(
                        text: 'Verify OTP',
                        onPressed: (){
                          _otpConfirm(context);
                        },
                      ),
                      const SizedBox(height: 20),
                      if (!isKeyboardOpen)
                        Container(
                          height: 70,
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              vertical: 20.0),
                          child: GestureDetector(
                            onTap: () {
                              _otpResend(context);
                            },
                            child: const Text(
                              'Didn\'t receive the code? Resend',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ),
                      if (!isKeyboardOpen) SizedBox(height: 20.h),
                    ],
                  ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
