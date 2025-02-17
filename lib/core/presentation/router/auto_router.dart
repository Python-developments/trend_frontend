import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:injectable/injectable.dart';
import 'package:trend/dependencies.dart';

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
        AutoRoute(page: ConfirmReceiverRoute.page),
        AutoRoute(page: SubmitNewPasswordRoute.page,),
        AutoRoute(page: EditProfileRoute.page,),
        AutoRoute(page: SubmitEmailRoute.page,),
        AutoRoute(page: SettingsRoute.page,),
        AutoRoute(page: AppErrorRoute.page,),
      ];
}

@module
abstract class AppRouterModule {
  @singleton
  AppRouter get getAppRouter => AppRouter();
}

AppRouter getAppRouter =getIt<AppRouter>();
