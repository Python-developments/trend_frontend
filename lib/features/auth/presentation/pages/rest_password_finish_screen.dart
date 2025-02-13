import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../shared/const/colors.dart';
import '../../../../shared/style/app_styles.dart';
import '../../../../shared/utiles/routes.dart';
import '../../../authentication/presentation/widgets/custom_button.dart';
import '../manager/auth_bloc.dart';
import '../manager/auth_event.dart';
import '../manager/auth_state.dart';
import '../widgets/customer_text_form.dart';



class RestPasswordFinishScreen extends StatelessWidget {
  RestPasswordFinishScreen({Key? key}) : super(key: key);

  final TextEditingController _passwordController =
      TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _validateAndLogin(BuildContext context, String restToken) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Clear previous SnackBars
    if (_formKey.currentState!.validate() ) {
      if(_passwordController.text.trim() == _confirmPasswordController.text.trim()){
        context.read<AuthBloc>().add(RestPasswordFinishEvent(
            restToken: restToken,
            password: _passwordController.text.trim())); 
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Confirm Password not match with Password")),
        );
      }
    } 
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    final String? refreshToken = ModalRoute.of(context)?.settings.arguments as String?;
    

    return Scaffold(
        backgroundColor: Color(AppColors.white),
        body: BlocConsumer<AuthBloc, AuthState>(
          buildWhen: (previous, current) => previous != current,
          listener: (context, state) {
            ScaffoldMessenger.of(context).hideCurrentSnackBar(); // Clear previous SnackBars
            if (state is RestPasswordFinish) {
              print(state.message);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('${state.message}')),
              );
              Future.microtask(() => Navigator.pushReplacementNamed(
                context,
                AppRoutes.login,
              ));
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
                            crossAxisAlignment:
                                CrossAxisAlignment.stretch,
                            children: [
                              SizedBox(height: 120.h),
                              Text('Reset Password',
                                  textAlign: TextAlign.center,
                                  style: AppStyles.styleSemiBold25(
                                      context)),
                              SizedBox(height: 30),
                              Text(
                                  'Enter your new password and confirm it',
                                  textAlign: TextAlign.center,
                                  style: AppStyles.styleNormal13(
                                          context)
                                      .copyWith(
                                          color: Color(
                                              AppColors.greyDark))),
                              SizedBox(height: 60.h),
                              CustomerTextForm(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password is required';
                                  }else if (value.length < 8) {
                                    return 'Password must be at least 8 characters long';
                                  }
                                  return null;
                                },
                                name: 'Password Address',
                                isPassword: false,
                                controller: _passwordController,
                                onFieldSubmitted: () {
                                  _validateAndLogin(context,refreshToken??"");
                                },
                              ),
                              SizedBox(height: 12),
                              CustomerTextForm(
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password is required';
                                  }else if (value.length < 8) {
                                    return 'Password must be at least 8 characters long';
                                  }
                                  return null;
                                },
                                name: 'Confirm Password',
                                isPassword: false,
                                controller: _confirmPasswordController,
                                onFieldSubmitted: () {
                                  _validateAndLogin(context,refreshToken??"");
                                },
                              ),
                              SizedBox(height: 40),
                              Visibility(
                                  visible: state is AuthLoading,
                                  child: Center(
                                      child:
                                          CircularProgressIndicator(
                                    color: Color(AppColors.black),
                                  ))),
                              Visibility(
                                visible: !(state is AuthLoading),
                                child: CustomButton(
                                  text: 'Reset Password',
                                  onPressed: () =>
                                      _validateAndLogin(context,refreshToken??""),
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
