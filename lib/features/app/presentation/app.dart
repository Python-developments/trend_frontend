import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:toastification/toastification.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/core/presentation/snake_bars/bottom_snack_bar.dart';
import 'package:trend/core/utils/flavors.dart';
import 'package:trend/dependencies.dart';



class App extends StatefulWidget {
  final Flavor appFlavor;
  const App({required this.appFlavor, super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  @override
  Widget build(final BuildContext context) {
    return ToastificationWrapper(
      config: const ToastificationConfig(
          alignment:Alignment.bottomCenter ),
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        scaffoldMessengerKey: getIt<SnakeBarShower>().snakeBarKey,
        routerConfig: getAppRouter.config(),
      /*
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: EasyLocalization.of(context)?.currentLocale ?? context.deviceLocale,*/
        theme: AppStyle.theme,
      
        builder: widget.appFlavor.isMultiDevicePreview
            ? DevicePreview.appBuilder
            : (final context, final child) => MediaQuery(
                data: MediaQuery.of(context).copyWith(
                    viewPadding: EdgeInsets.zero,
                    textScaler: TextScaler.noScaling
                ),
                child:child!),
        // home: const SplashPage(),
      ),
    );
  }
}
