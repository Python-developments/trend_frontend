import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:trend/core/presentation/arguments/submit_new_password_arguments.dart';
import 'package:trend/core/presentation/arguments/submit_receiver_page_arguments.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/dependencies.dart';
import 'package:trend/features/app/presentation/pages/app_error_page.dart';
import 'package:trend/features/app/presentation/pages/splash_screen_page.dart';
import 'package:trend/features/auth/presentation/pages/login_page.dart';
import 'package:trend/features/auth/presentation/pages/register_page.dart';
import 'package:trend/features/auth/presentation/pages/submit_email_page.dart';
import 'package:trend/features/auth/presentation/pages/submit_new_password_page.dart';
import 'package:trend/features/home/presentation/pages/home_page_navigation.dart';
import 'package:trend/features/profile/presentation/Pages/editi_full_name_page.dart';
import 'package:trend/features/profile/presentation/pages/EditBioPage.dart';

part 'auto_router.gr.dart';


@AutoRouterConfig()
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: SplashRouteRoute.page, initial: true,),
        AutoRoute(page: HomeRouteNavigation.page),
        AutoRoute(page: RegisterRoute.page),
        AutoRoute(page: LoginRoute.page),
        AutoRoute(page: SubmitNewPasswordRoute.page,),
        AutoRoute(page: SubmitEmailRoute.page,),
        AutoRoute(page: AppErrorRoute.page,),
      ];
}

@module
abstract class AppRouterModule {
  @singleton
  AppRouter get getAppRouter => AppRouter();
}

AppRouter getAppRouter =getIt<AppRouter>();
