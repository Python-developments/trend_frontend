import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/features/auth/presentation/widgets/customer_button.dart';
import 'package:trend/features/notifications/presentation/Manager/NotificationBloc/notification_bloc.dart';
import 'package:trend/features/posts/presentation/Manager/Bloc_Current_user/Current%20_user_Bloc.dart';
import 'package:trend/features/posts/presentation/Manager/Bloc_Current_user/Current%20_user_event.dart';
import 'package:trend/shared/const/colors.dart';
import 'package:trend/shared/style/app_styles.dart';

import '../../../../../shared/core/local/SharedPreferencesDemo.dart';
import '../../../../../shared/utiles/routes.dart';
import '../../data/models/local/register_model_local.dart';
import '../manager/auth_bloc.dart';
import '../manager/auth_event.dart';
import '../manager/auth_state.dart';
import '../widgets/customer_text_form.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen = MediaQuery.of(context).viewInsets.bottom > 0;

    void _validateAndSignup(BuildContext context) {
      ScaffoldMessenger.of(context)
          .hideCurrentSnackBar(); // Clear previous SnackBars
      if (_formKey.currentState!.validate()) {
        context.read<AuthBloc>().add(RegisterEvent(
            registerModel: RegisterModelLocal(
                userName: _usernameController.text.trim(),
                email: _emailController.text.trim(),
                password: _passwordController.text.trim(),
                confirmPassword: _confirmPasswordController.text.trim(),
                fullName: "")));
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('Please enter a valid credentials')),
        );
      }
    }

    return Scaffold(
      backgroundColor: Color(AppColors.white),
      body: BlocConsumer<AuthBloc, AuthState>(
        buildWhen: (previous, current) => previous != current,
        listener: (context, state) async {
          ScaffoldMessenger.of(context)
              .hideCurrentSnackBar(); // Clear previous SnackBars
          if (state is AuthRegistered) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                  content:
                      Text("Welcome ${state.registerModel.data?.username}")),
            );
            int c = await SharedPreferencesDemo.loadUserData().id;
            BlocProvider.of<CurrentUserBloc>(context)
                .add(GetPostForCurrentUserEvent(id: c));
            BlocProvider.of<NotificationBloc>(context)
                .add(FetchNotificationsEvent());
            Navigator.pushReplacementNamed(
                  context,
                  AppRoutes.otpConfirm,
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
                            SizedBox(height: 100.h),
                            Text('Create Account',
                                textAlign: TextAlign.center,
                                style: AppStyles.styleSemiBold25(context)),
                            SizedBox(height: 30),
                            Text(
                                'Pick a username for your account. You can always change it later.',
                                textAlign: TextAlign.center,
                                style: AppStyles.styleNormal13(context)
                                    .copyWith(
                                        color: Color(AppColors.greyDark))),
                            SizedBox(height: 30),
                            CustomerTextForm(
                                name: 'Username',
                                isPassword: false,
                                controller: _usernameController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your username';
                                  }
                                  return null;
                                },
                                onFieldSubmitted: () {}),
                            SizedBox(height: 12),
                            CustomerTextForm(
                                name: 'Email Address',
                                isPassword: false,
                                controller: _emailController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your email';
                                  }
                                  if (!RegExp(r'^[^@]+@[^@]+\.[^@]+')
                                      .hasMatch(value)) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                                onFieldSubmitted: () {}),
                            SizedBox(height: 12),
                            CustomerTextForm(
                                name: 'Password',
                                isPassword: true,
                                controller: _passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please enter your password';
                                  }
                                  if (value.length < 6) {
                                    return 'Password must be at least 6 characters';
                                  }
                                  return null;
                                },
                                onFieldSubmitted: () {}),
                            SizedBox(height: 12),
                            CustomerTextForm(
                                name: 'Confirm Password',
                                isPassword: true,
                                controller: _confirmPasswordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Please confirm your password';
                                  }
                                  if (value != _passwordController.text) {
                                    return 'Passwords do not match';
                                  }
                                  return null;
                                },
                                onFieldSubmitted: () =>
                                    _validateAndSignup(context)),
                            SizedBox(height: 30.h),
                            Visibility(
                              visible: state is! AuthLoading,
                              child: CustomButton(
                                text: 'Sign Up',
                                onPressed: () => _validateAndSignup(context),
                              ),
                            ),
                            Visibility(
                              visible: state is AuthLoading,
                              child: Center(
                                child: CircularProgressIndicator(
                                  color: Color(AppColors.black),
                                ),
                              ),
                            ),
                            SizedBox(height: 20),
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
                          child: Text('Back to Login',
                              style: AppStyles.styleNormal16(context)
                                  .copyWith(color: Color(AppColors.blue))),
                        ),
                      ),
                    if (!isKeyboardOpen) SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
