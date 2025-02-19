import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/core/presentation/validators/is_name_validator.dart';
import 'package:trend/core/presentation/widgets/main_button.dart';
import 'package:trend/core/presentation/widgets/text_fields/email_text_field.dart';
import 'package:trend/core/presentation/widgets/text_fields/form_controller_text_field.dart';
import 'package:trend/core/presentation/widgets/text_fields/password_text_field.dart';
import 'package:trend/dependencies.dart';
import 'package:trend/features/auth/controllers/register_controller.dart';

@RoutePage()
class RegisterPage extends StatefulWidget {
  const RegisterPage({ super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final RegisterController controller  = getIt<RegisterController>();

  @override
  Widget build(final BuildContext context) {
    return Form(
        key: controller.formKey,
        child: Observer(
          builder: (final _) => Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    SizedBox(height: 100.h),
                    Text(
                      'Create Account',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 25.sp,
                      ),
                    ),
                    SizedBox(height: 30.h),
                    Text(
                      'Pick a username for your account. You can always change it later.',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 15.sp,
                        color: Colors.grey,
                      ),
                    ),
                    SizedBox(height: 20.h),
                    FormControllerTextField(
                      title: 'Username',
                      formController: controller,
                      validator: IsNameValidator(),
                      fieldKey: 'username',errorKey: 'username',
                    ),
                    SizedBox(height: 10.h),
                    EmailTextField(
                      formController: controller,
                    ),
                    SizedBox(height: 10.h),
                    PasswordTextField(
                      formController: controller,
                    ),
                    SizedBox(height: 10.h),
                    PasswordTextField(
                      title: 'Confirm Password',
                      formController: controller,
                      fieldKey: 'confirmPassword',
                      errorKey: 'confirmPassword',
                    ),
                    SizedBox(height: 30.h),
                    Center(
                      child: MainButton(
                        title: 'Sign Up',
                        isLoading: controller.isLoading,
                        onPressed: controller.submitForm,
                      ),
                    ),
                    SizedBox(height: 20.h),
                  ],
                ),
              ),
            ),
                Center(
                child: TextButton(
                  onPressed: ()=>getAppRouter.replace(LoginRoute()),
                  child: const Text(
                    'Back to Login',
                    style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            SizedBox(height: 20.h),
          ],
        ),
    ),
        ));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
