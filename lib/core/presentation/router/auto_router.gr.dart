// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'auto_router.dart';

/// generated route for
/// [AppErrorPage]
class AppErrorRoute extends PageRouteInfo<AppErrorRouteArgs> {
  AppErrorRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AppErrorRoute.name,
          args: AppErrorRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AppErrorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AppErrorRouteArgs>(
          orElse: () => const AppErrorRouteArgs());
      return AppErrorPage(key: args.key);
    },
  );
}

class AppErrorRouteArgs {
  const AppErrorRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AppErrorRouteArgs{key: $key}';
  }
}

/// generated route for
/// [SplashScreenPage]
class SplashRouteRoute extends PageRouteInfo<void> {
  const SplashRouteRoute({List<PageRouteInfo>? children})
      : super(
          SplashRouteRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashRouteRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashScreenPage();
    },
  );
}
