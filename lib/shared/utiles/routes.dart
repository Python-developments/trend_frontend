import 'package:flutter/material.dart';
import 'package:trend/features/auth/presentation/pages/login_screen.dart';
import 'package:trend/features/auth/presentation/pages/register_screen.dart';
import 'package:trend/features/authentication/presentation/pages/login.dart';
import 'package:trend/features/authentication/presentation/pages/reset_password.dart';
import 'package:trend/features/authentication/presentation/pages/signup.dart';
import 'package:trend/features/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:trend/features/posts/data/models/post_model.dart';
import 'package:trend/features/posts/presentation/Pages/home_page.dart';
import 'package:trend/features/profile/presentation/Pages/user_profile/user_profile.dart';

import '../../features/auth/presentation/pages/otp_confirm.dart';

class AppRoutes {
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String resetPassword = '/reset-password';
  static const String userProfile = '/UserProfile';
  static const String otpConfirm = '/otp-confirm';
}

Map<String, WidgetBuilder> routes = {
  AppRoutes.login: (context) => LoginScreen2(),
  AppRoutes.register: (context) => RegisterScreen(),
  AppRoutes.resetPassword: (context) => ResetPasswordPage(),
  AppRoutes.home: (context) => MainScreen(),
  AppRoutes.userProfile: (context) => UserProfile(),
  AppRoutes.otpConfirm: (context) => OtpConfirmScreen(),
};

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.resetPassword:
      return MaterialPageRoute(builder: (_) => ResetPasswordPage());
    case AppRoutes.login:
      return MaterialPageRoute(builder: (_) => LoginScreen2());
    case AppRoutes.register:
      return MaterialPageRoute(builder: (_) => RegisterScreen());
    case AppRoutes.home:
      return MaterialPageRoute(builder: (_) => HomePage());
    case AppRoutes.otpConfirm:
      return MaterialPageRoute(builder: (_) => OtpConfirmScreen());
    case AppRoutes.userProfile:
      final model = settings.arguments as PostModel;
      return MaterialPageRoute(builder: (_) => UserProfile());
    default:
      return MaterialPageRoute(
        builder: (_) => Scaffold(
          body: Center(
            child: Text('404: Page not found'),
          ),
        ),
      );
  }
}
