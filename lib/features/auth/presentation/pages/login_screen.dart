import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/features/auth/presentation/pages/register_screen.dart';
import 'package:trend/features/auth/presentation/widgets/customer_button.dart';
import 'package:trend/shared/style/app_styles.dart';
import '../../../../shared/const/colors.dart';
import '../../../../shared/core/local/SharedPreferencesDemo.dart';
import '../../../../shared/utiles/routes.dart';
import '../../../notifications/presentation/Manager/NotificationBloc/notification_bloc.dart';
import '../../../posts/presentation/Manager/Bloc_Current_user/Current _user_Bloc.dart';
import '../../../posts/presentation/Manager/Bloc_Current_user/Current _user_event.dart';
import '../manager/auth_bloc.dart';
import '../manager/auth_event.dart';
import '../manager/auth_state.dart';
import '../widgets/customer_text_form.dart';


class LoginScreen2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: LoginComponent(),
    );
  }
}

class LoginComponent extends StatelessWidget {
  LoginComponent({super.key});

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _usernameController =
      TextEditingController();
  final TextEditingController _passwordController =
      TextEditingController();

  void _validateAndLogin(BuildContext context) {
    if (_formKey.currentState!.validate()) {
      context.read<AuthBloc>().add(LoginEvent(
            username: _usernameController.text,
            password: _passwordController.text,
          ));
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Please fix the errors')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    bool isKeyboardOpen =
        MediaQuery.of(context).viewInsets.bottom > 0;
    return BlocConsumer<AuthBloc, AuthState>(
      listener: (context, state) async {
        if (state is AuthAuthenticated) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
                content: Text(
                    'Welcome, ${state.loginModel.userInfo?.fullName}!')),
          );
          int c = await SharedPreferencesDemo.loadUserData().id;
          BlocProvider.of<CurrentUserBloc>(context)
              .add(GetPostForCurrentUserEvent(id: c));
          BlocProvider.of<NotificationBloc>(context)
              .add(FetchNotificationsEvent());
          Navigator.pushReplacementNamed(context, AppRoutes.home);
        } else if (state is AuthError) {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('${state.message}')),
          );
          if (state.message.contains("verify your email")){
            Navigator.pushNamed(context, AppRoutes.otpConfirm);
          }
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
                          SizedBox(height: 150.h),
                          Text(
                            'T  R  E  N  D',
                            textAlign: TextAlign.center,
                            style: AppStyles.styleBold30(context)
                          ),
                          SizedBox(height: 60.h),
                          CustomerTextForm(
                              name: 'Username',
                              controller: _usernameController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your username';
                                }
                                return null;
                              },
                              onFieldSubmitted: () {
                                _validateAndLogin(context);
                              }),
                          SizedBox(height: 10),
                          CustomerTextForm(
                              name: 'Password',
                              controller: _passwordController,
                              isPassword: true,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Please enter your password';
                                }
                                if (value.length < 6) {
                                  return 'Password must be at least 6 characters';
                                }
                                return null;
                              },
                              onFieldSubmitted: () {
                                _validateAndLogin(context);
                              }),
                          SizedBox(height: 30.h),
                          Visibility(
                              visible: state is AuthLoading,
                              child: Center(
                                  child: CircularProgressIndicator(
                                color: Color(AppColors.black),
                              ))),
                          Visibility(
                            visible: !(state is AuthLoading),
                            child: CustomButton(
                              text: 'Login',
                              onPressed: () =>
                                  _validateAndLogin(context),
                            ),
                          ),
                          SizedBox(height: 10),
                          Align(
                            alignment: Alignment.centerRight,
                            child: TextButton(
                              onPressed: () {
                                // Navigator.pushNamed(context,
                                //     AppRoutes.resetPassword);
                              },
                              child: const Text(
                                'Forgot password?',
                                style: TextStyle(
                                  overflow: TextOverflow.ellipsis,
                                  color: Colors.blue,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 5),
                          Row(
                            children: [
                              const Expanded(
                                child: Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 10.w),
                                child: Text(
                                  'OR',
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    color: Colors.grey,
                                  ),
                                ),
                              ),
                              const Expanded(
                                child: Divider(
                                  color: Colors.grey,
                                  thickness: 1,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 20),
                          Row(
                            mainAxisAlignment:
                                MainAxisAlignment.spaceEvenly,
                            children: [
                              ...[
                                'google.png',
                                'facebook.png',
                                'tiktok.png',
                                'instagram.png'
                              ]
                                  .map(
                                    (icon) => Flexible(
                                      child: GestureDetector(
                                        onTap: () {},
                                        child: FittedBox(
                                          fit: BoxFit.fill,
                                          child: Image.asset(
                                            'assets/icons/$icon',
                                            width: 35.h,
                                            height: 35.h,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ],
                          ),
                          SizedBox(height: 20),
                        ],
                      ),
                    ),
                  ),
                  if (!isKeyboardOpen)
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text('Don\'t have an account?'),
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                                context, AppRoutes.register);
                          },
                          child: const Text(
                            'Sign up',
                            style: TextStyle(
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                  if (!isKeyboardOpen) SizedBox(height: 20),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
