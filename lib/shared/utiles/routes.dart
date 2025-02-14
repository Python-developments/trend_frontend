import 'package:flutter/material.dart';
import 'package:trend/features/auth/presentation/pages/login_screen.dart';
import 'package:trend/features/auth/presentation/pages/register_screen.dart';
import 'package:trend/features/bottom_nav_bar/bottom_nav_bar.dart';
import 'package:trend/features/posts/data/models/post_model.dart';
import 'package:trend/features/posts/presentation/Pages/home_page.dart';
import 'package:trend/features/profile/presentation/Pages/user_profile/user_profile.dart';
import '../../features/auth/presentation/pages/otp_confirm_screen.dart';
import '../../features/auth/presentation/pages/reset_password_send_email_screen.dart';
import '../../features/auth/presentation/pages/reset_password_verify_otp_screen.dart';
import '../../features/auth/presentation/pages/rest_password_finish_screen.dart';
import '../../features/splash/presentation/pages/splash_screen.dart';


class AppRoutes {
  static const String home = '/home';
  static const String login = '/login';
  static const String register = '/register';
  static const String userProfile = '/UserProfile';
  static const String otpConfirm = '/otp-confirm';

  static const String resetPasswordSendEmail = '/reset-password-send-email';
  static const String resetPasswordConfirmOtp = '/password-confirm-otp';
  static const String resetPasswordFinish = '/password-finish';
  static const String splashScreen = '/splash-screen';
}

Map<String, WidgetBuilder> routes = {
  AppRoutes.login: (context) => LoginScreen2(),
  AppRoutes.register: (context) => RegisterScreen(),
  AppRoutes.home: (context) => MainScreen(),
  AppRoutes.userProfile: (context) => UserProfile(),
  AppRoutes.otpConfirm: (context) => OtpConfirmScreen(),
  
  AppRoutes.resetPasswordSendEmail: (context) => ResetPasswordSendEmailScreen(),
  AppRoutes.resetPasswordConfirmOtp: (context) => ResetPasswordConfirmEmilScreen(),
  
  AppRoutes.resetPasswordFinish: (context) => RestPasswordFinishScreen(),
  AppRoutes.splashScreen: (context) => SplashScreen(),

};

Route<dynamic>? onGenerateRoute(RouteSettings settings) {
  switch (settings.name) {
    case AppRoutes.resetPasswordSendEmail:
      return MaterialPageRoute(builder: (_) => ResetPasswordConfirmEmilScreen());
    case AppRoutes.splashScreen:
      return MaterialPageRoute(builder: (_) => SplashScreen());
    case AppRoutes.resetPasswordConfirmOtp:
      return MaterialPageRoute(builder: (_) => ResetPasswordConfirmEmilScreen());
    case AppRoutes.resetPasswordFinish:
      return MaterialPageRoute(builder: (_) => RestPasswordFinishScreen());
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
