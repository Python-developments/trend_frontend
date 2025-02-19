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
/// [HomePageNavigation]
class HomeRouteNavigation extends PageRouteInfo<HomeRouteNavigationArgs> {
  HomeRouteNavigation({
    Key? key,
    HomeNavigationBarTileType? initialTile,
    List<PageRouteInfo>? children,
  }) : super(
          HomeRouteNavigation.name,
          args: HomeRouteNavigationArgs(
            key: key,
            initialTile: initialTile,
          ),
          initialChildren: children,
        );

  static const String name = 'HomeRouteNavigation';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<HomeRouteNavigationArgs>(
          orElse: () => const HomeRouteNavigationArgs());
      return HomePageNavigation(
        key: args.key,
        initialTile: args.initialTile,
      );
    },
  );
}

class HomeRouteNavigationArgs {
  const HomeRouteNavigationArgs({
    this.key,
    this.initialTile,
  });

  final Key? key;

  final HomeNavigationBarTileType? initialTile;

  @override
  String toString() {
    return 'HomeRouteNavigationArgs{key: $key, initialTile: $initialTile}';
  }
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute({List<PageRouteInfo>? children})
      : super(
          LoginRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginPage();
    },
  );
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<void> {
  const RegisterRoute({List<PageRouteInfo>? children})
      : super(
          RegisterRoute.name,
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RegisterPage();
    },
  );
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

/// generated route for
/// [SubmitEmailPage]
class SubmitEmailRoute extends PageRouteInfo<SubmitEmailRouteArgs> {
  SubmitEmailRoute({
    required SubmitReceiverPageArguments args,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SubmitEmailRoute.name,
          args: SubmitEmailRouteArgs(
            args: args,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SubmitEmailRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SubmitEmailRouteArgs>();
      return SubmitEmailPage(
        args: args.args,
        key: args.key,
      );
    },
  );
}

class SubmitEmailRouteArgs {
  const SubmitEmailRouteArgs({
    required this.args,
    this.key,
  });

  final SubmitReceiverPageArguments args;

  final Key? key;

  @override
  String toString() {
    return 'SubmitEmailRouteArgs{args: $args, key: $key}';
  }
}

/// generated route for
/// [SubmitNewPasswordPage]
class SubmitNewPasswordRoute extends PageRouteInfo<SubmitNewPasswordRouteArgs> {
  SubmitNewPasswordRoute({
    required SubmitNewPasswordArguments args,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SubmitNewPasswordRoute.name,
          args: SubmitNewPasswordRouteArgs(
            args: args,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SubmitNewPasswordRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SubmitNewPasswordRouteArgs>();
      return SubmitNewPasswordPage(
        args: args.args,
        key: args.key,
      );
    },
  );
}

class SubmitNewPasswordRouteArgs {
  const SubmitNewPasswordRouteArgs({
    required this.args,
    this.key,
  });

  final SubmitNewPasswordArguments args;

  final Key? key;

  @override
  String toString() {
    return 'SubmitNewPasswordRouteArgs{args: $args, key: $key}';
  }
}
