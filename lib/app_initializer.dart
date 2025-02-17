import 'package:device_preview/device_preview.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mobx/mobx.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/utils/flavors.dart';
import 'package:trend/data/errors/core_errors.dart';
import 'package:trend/dependencies.dart';

Future<void> customAppRunner(final Flavor flavor) async {
  WidgetsFlutterBinding.ensureInitialized();

  if(!flavor.showErrors) {
    ErrorWidget.builder = (final FlutterErrorDetails flutterErrorDetails) =>Text(
      SomethingWentWrongError().errorMessage,
      style: AppStyle.textTheme.bodyMedium,
    );
  }
/*
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );*/
  await EasyLocalization.ensureInitialized();
  EasyLocalization.logger.enableLevels = [];
  mainContext.config =
      mainContext.config.clone(disableErrorBoundaries: flavor.showErrors);

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    systemNavigationBarIconBrightness: Brightness.light,
  ));
  await SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);


  configureDependencies(flavor.name);

  runApp(DevicePreview(
      enabled: flavor.isMultiDevicePreview,
      builder: (final context) => EasyLocalization(
              supportedLocales: const [
                Locale('en'),
                Locale('ar'),
              ],
              path: 'assets/translations',
              fallbackLocale: const Locale('en'),
              child: ScreenUtilInit(
                  designSize: const Size(375, 812),
                  splitScreenMode: true,
                  minTextAdapt: true,
                  child: App(
                    appFlavor: flavor,
                  )))));
}
