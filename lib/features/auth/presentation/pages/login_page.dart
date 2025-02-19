
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/validators/is_not_empty_validator.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/core/presentation/widgets/main_button.dart';
import 'package:trend/core/presentation/widgets/text_fields/form_controller_text_field.dart';
import 'package:trend/core/presentation/widgets/text_fields/password_text_field.dart';
import 'package:trend/dependencies.dart';
import 'package:trend/features/auth/controllers/login_controller.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final LoginController controller= getIt<LoginController>();

  @override
  Widget build(final BuildContext context) {
    /*final List<(String, void Function())> tiles = [
      (Assets.gmail, controller.loginUsingGmail),
      if (Platform.isIOS) (Assets.apple, controller.loginUsingApple),
      (Assets.facebook, controller.loginUsingFacebook),
    ];*/
    return Form(
        key: controller.formKey,
        child:Observer(
        builder: (final _) =>Scaffold(
          body:Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding:  EdgeInsets.symmetric(horizontal:  16.w),

                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        SizedBox(height: 200.h),
                        Text(
                          'T  R  E  N  D',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 30.sp,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        FormControllerTextField(
                          formController: controller,
                          fieldKey: 'username',errorKey: 'username',
                          title: 'Username',
                          validator: IsNotEmptyValidator(),
                        ),
                        SizedBox(height: 10.h),
                        PasswordTextField(formController: controller),
                        SizedBox(height: 30.h),
                        Center(
                          child: MainButton(
                            title: 'Login',
                            isLoading: controller.isLoading,
                            onPressed: controller.submitForm,
                          ),
                        ),
                        SizedBox(height: 10.h),
                        GestureDetector(
                          onTap: controller.restorePassword,
                          child: const Text(
                            'Forgot password?',
                            style: TextStyle(
                              overflow: TextOverflow.ellipsis,
                              color: Colors.blue,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: 5.h),
                        Row(
                          children: [
                            const Expanded(
                              child: Divider(
                                color: Colors.grey,
                                thickness: 1,
                              ),
                            ),
                            Padding(
                              padding:
                              EdgeInsets.symmetric(horizontal: 10.w),
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
                        SizedBox(height: 20.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                'assets/icons/google.png',
                                width: 33.w,
                                height: 40.h,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                'assets/icons/facebook.png',
                                width: 38.w,
                                height: 40.h,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                'assets/icons/tiktok.png',
                                width: 38.w,
                                height: 40.h,
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Image.asset(
                                'assets/icons/instagram.png',
                                width: 42.w,
                                height: 40.h,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 20.h),
                      ],
                    ),
                  ),
                ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text('Don\'t have an account?'),
                      TextButton(
                        onPressed: ()=>getAppRouter.replace(RegisterRoute()),
                        child: const Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  )
              ],
            ),
          ))
        );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
