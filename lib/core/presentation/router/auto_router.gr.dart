// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'auto_router.dart';

/// generated route for
/// [AddressDetailsPage]
class AddressDetailsRoute extends PageRouteInfo<AddressDetailsRouteArgs> {
  AddressDetailsRoute({
    required AddressDetailsPageArguments args,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AddressDetailsRoute.name,
          args: AddressDetailsRouteArgs(
            args: args,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'AddressDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddressDetailsRouteArgs>();
      return AddressDetailsPage(
        args: args.args,
        key: args.key,
      );
    },
  );
}

class AddressDetailsRouteArgs {
  const AddressDetailsRouteArgs({
    required this.args,
    this.key,
  });

  final AddressDetailsPageArguments args;

  final Key? key;

  @override
  String toString() {
    return 'AddressDetailsRouteArgs{args: $args, key: $key}';
  }
}

/// generated route for
/// [AddressSelectionPage]
class AddressSelectionRoute extends PageRouteInfo<AddressSelectionRouteArgs> {
  AddressSelectionRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AddressSelectionRoute.name,
          args: AddressSelectionRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddressSelectionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddressSelectionRouteArgs>(
          orElse: () => const AddressSelectionRouteArgs());
      return AddressSelectionPage(key: args.key);
    },
  );
}

class AddressSelectionRouteArgs {
  const AddressSelectionRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AddressSelectionRouteArgs{key: $key}';
  }
}

/// generated route for
/// [AddressesPage]
class AddressesRoute extends PageRouteInfo<AddressesRouteArgs> {
  AddressesRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          AddressesRoute.name,
          args: AddressesRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'AddressesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<AddressesRouteArgs>(
          orElse: () => const AddressesRouteArgs());
      return AddressesPage(key: args.key);
    },
  );
}

class AddressesRouteArgs {
  const AddressesRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'AddressesRouteArgs{key: $key}';
  }
}

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
/// [CategoryVendorsPage]
class CategoryVendorsRoute extends PageRouteInfo<CategoryVendorsRouteArgs> {
  CategoryVendorsRoute({
    required String selectedCategory,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          CategoryVendorsRoute.name,
          args: CategoryVendorsRouteArgs(
            selectedCategory: selectedCategory,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'CategoryVendorsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<CategoryVendorsRouteArgs>();
      return CategoryVendorsPage(
        selectedCategory: args.selectedCategory,
        key: args.key,
      );
    },
  );
}

class CategoryVendorsRouteArgs {
  const CategoryVendorsRouteArgs({
    required this.selectedCategory,
    this.key,
  });

  final String selectedCategory;

  final Key? key;

  @override
  String toString() {
    return 'CategoryVendorsRouteArgs{selectedCategory: $selectedCategory, key: $key}';
  }
}

/// generated route for
/// [CheckoutPage]
class CheckoutRoute extends PageRouteInfo<void> {
  const CheckoutRoute({List<PageRouteInfo>? children})
      : super(
          CheckoutRoute.name,
          initialChildren: children,
        );

  static const String name = 'CheckoutRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CheckoutPage();
    },
  );
}

/// generated route for
/// [ConfirmReceiverPage]
class ConfirmReceiverRoute extends PageRouteInfo<ConfirmReceiverRouteArgs> {
  ConfirmReceiverRoute({
    required ConfirmReceiverPageArguments args,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ConfirmReceiverRoute.name,
          args: ConfirmReceiverRouteArgs(
            args: args,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ConfirmReceiverRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ConfirmReceiverRouteArgs>();
      return ConfirmReceiverPage(
        args: args.args,
        key: args.key,
      );
    },
  );
}

class ConfirmReceiverRouteArgs {
  const ConfirmReceiverRouteArgs({
    required this.args,
    this.key,
  });

  final ConfirmReceiverPageArguments args;

  final Key? key;

  @override
  String toString() {
    return 'ConfirmReceiverRouteArgs{args: $args, key: $key}';
  }
}

/// generated route for
/// [EditProfilePage]
class EditProfileRoute extends PageRouteInfo<void> {
  const EditProfileRoute({List<PageRouteInfo>? children})
      : super(
          EditProfileRoute.name,
          initialChildren: children,
        );

  static const String name = 'EditProfileRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const EditProfilePage();
    },
  );
}

/// generated route for
/// [EventDetailsPage]
class EventDetailsRoute extends PageRouteInfo<EventDetailsRouteArgs> {
  EventDetailsRoute({
    required EventDetailsPageArguments args,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          EventDetailsRoute.name,
          args: EventDetailsRouteArgs(
            args: args,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'EventDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<EventDetailsRouteArgs>();
      return EventDetailsPage(
        args: args.args,
        key: args.key,
      );
    },
  );
}

class EventDetailsRouteArgs {
  const EventDetailsRouteArgs({
    required this.args,
    this.key,
  });

  final EventDetailsPageArguments args;

  final Key? key;

  @override
  String toString() {
    return 'EventDetailsRouteArgs{args: $args, key: $key}';
  }
}

/// generated route for
/// [FavoritesPage]
class FavoritesRoute extends PageRouteInfo<FavoritesRouteArgs> {
  FavoritesRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          FavoritesRoute.name,
          args: FavoritesRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'FavoritesRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<FavoritesRouteArgs>(
          orElse: () => const FavoritesRouteArgs());
      return FavoritesPage(key: args.key);
    },
  );
}

class FavoritesRouteArgs {
  const FavoritesRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'FavoritesRouteArgs{key: $key}';
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
/// [JoinAsVendorPage]
class JoinAsVendorRoute extends PageRouteInfo<void> {
  const JoinAsVendorRoute({List<PageRouteInfo>? children})
      : super(
          JoinAsVendorRoute.name,
          initialChildren: children,
        );

  static const String name = 'JoinAsVendorRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const JoinAsVendorPage();
    },
  );
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<LoginRouteArgs> {
  LoginRoute({
    required LoginPageArguments args,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          LoginRoute.name,
          args: LoginRouteArgs(
            args: args,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'LoginRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<LoginRouteArgs>();
      return LoginPage(
        args: args.args,
        key: args.key,
      );
    },
  );
}

class LoginRouteArgs {
  const LoginRouteArgs({
    required this.args,
    this.key,
  });

  final LoginPageArguments args;

  final Key? key;

  @override
  String toString() {
    return 'LoginRouteArgs{args: $args, key: $key}';
  }
}

/// generated route for
/// [MapLocationSelectionPage]
class MapLocationSelectionRoute
    extends PageRouteInfo<MapLocationSelectionRouteArgs> {
  MapLocationSelectionRoute({
    required MapLocationSelectionPageArguments args,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MapLocationSelectionRoute.name,
          args: MapLocationSelectionRouteArgs(
            args: args,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MapLocationSelectionRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MapLocationSelectionRouteArgs>();
      return MapLocationSelectionPage(
        args: args.args,
        key: args.key,
      );
    },
  );
}

class MapLocationSelectionRouteArgs {
  const MapLocationSelectionRouteArgs({
    required this.args,
    this.key,
  });

  final MapLocationSelectionPageArguments args;

  final Key? key;

  @override
  String toString() {
    return 'MapLocationSelectionRouteArgs{args: $args, key: $key}';
  }
}

/// generated route for
/// [MapLocationViewerPage]
class MapLocationViewerRoute extends PageRouteInfo<MapLocationViewerRouteArgs> {
  MapLocationViewerRoute({
    required MapLocationViewerPageArguments args,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          MapLocationViewerRoute.name,
          args: MapLocationViewerRouteArgs(
            args: args,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'MapLocationViewerRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<MapLocationViewerRouteArgs>();
      return MapLocationViewerPage(
        args: args.args,
        key: args.key,
      );
    },
  );
}

class MapLocationViewerRouteArgs {
  const MapLocationViewerRouteArgs({
    required this.args,
    this.key,
  });

  final MapLocationViewerPageArguments args;

  final Key? key;

  @override
  String toString() {
    return 'MapLocationViewerRouteArgs{args: $args, key: $key}';
  }
}

/// generated route for
/// [NotificationsPage]
class NotificationsRoute extends PageRouteInfo<void> {
  const NotificationsRoute({List<PageRouteInfo>? children})
      : super(
          NotificationsRoute.name,
          initialChildren: children,
        );

  static const String name = 'NotificationsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const NotificationsPage();
    },
  );
}

/// generated route for
/// [OrderDetailsPage]
class OrderDetailsRoute extends PageRouteInfo<OrderDetailsRouteArgs> {
  OrderDetailsRoute({
    required String orderId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          OrderDetailsRoute.name,
          args: OrderDetailsRouteArgs(
            orderId: orderId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OrderDetailsRouteArgs>();
      return OrderDetailsPage(
        orderId: args.orderId,
        key: args.key,
      );
    },
  );
}

class OrderDetailsRouteArgs {
  const OrderDetailsRouteArgs({
    required this.orderId,
    this.key,
  });

  final String orderId;

  final Key? key;

  @override
  String toString() {
    return 'OrderDetailsRouteArgs{orderId: $orderId, key: $key}';
  }
}

/// generated route for
/// [OrderNegativeRequestPage]
class OrderNegativeRequestRoute
    extends PageRouteInfo<OrderNegativeRequestRouteArgs> {
  OrderNegativeRequestRoute({
    required OrderNegativeRequestPageArguments args,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          OrderNegativeRequestRoute.name,
          args: OrderNegativeRequestRouteArgs(
            args: args,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderNegativeRequestRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OrderNegativeRequestRouteArgs>();
      return OrderNegativeRequestPage(
        args: args.args,
        key: args.key,
      );
    },
  );
}

class OrderNegativeRequestRouteArgs {
  const OrderNegativeRequestRouteArgs({
    required this.args,
    this.key,
  });

  final OrderNegativeRequestPageArguments args;

  final Key? key;

  @override
  String toString() {
    return 'OrderNegativeRequestRouteArgs{args: $args, key: $key}';
  }
}

/// generated route for
/// [OrderTrackingPage]
class OrderTrackingRoute extends PageRouteInfo<OrderTrackingRouteArgs> {
  OrderTrackingRoute({
    required OrderTrackingPageArguments args,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          OrderTrackingRoute.name,
          args: OrderTrackingRouteArgs(
            args: args,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'OrderTrackingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<OrderTrackingRouteArgs>();
      return OrderTrackingPage(
        args: args.args,
        key: args.key,
      );
    },
  );
}

class OrderTrackingRouteArgs {
  const OrderTrackingRouteArgs({
    required this.args,
    this.key,
  });

  final OrderTrackingPageArguments args;

  final Key? key;

  @override
  String toString() {
    return 'OrderTrackingRouteArgs{args: $args, key: $key}';
  }
}

/// generated route for
/// [OrdersPage]
class OrdersRoute extends PageRouteInfo<void> {
  const OrdersRoute({List<PageRouteInfo>? children})
      : super(
          OrdersRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrdersRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OrdersPage();
    },
  );
}

/// generated route for
/// [PrimaryBannerVendorsPage]
class PrimaryBannerVendorsRoute
    extends PageRouteInfo<PrimaryBannerVendorsRouteArgs> {
  PrimaryBannerVendorsRoute({
    required PrimaryBannerModel bannerModel,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          PrimaryBannerVendorsRoute.name,
          args: PrimaryBannerVendorsRouteArgs(
            bannerModel: bannerModel,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'PrimaryBannerVendorsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<PrimaryBannerVendorsRouteArgs>();
      return PrimaryBannerVendorsPage(
        bannerModel: args.bannerModel,
        key: args.key,
      );
    },
  );
}

class PrimaryBannerVendorsRouteArgs {
  const PrimaryBannerVendorsRouteArgs({
    required this.bannerModel,
    this.key,
  });

  final PrimaryBannerModel bannerModel;

  final Key? key;

  @override
  String toString() {
    return 'PrimaryBannerVendorsRouteArgs{bannerModel: $bannerModel, key: $key}';
  }
}

/// generated route for
/// [ProductDetailsPage]
class ProductDetailsRoute extends PageRouteInfo<ProductDetailsRouteArgs> {
  ProductDetailsRoute({
    required ProductDetailsPageArguments args,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ProductDetailsRoute.name,
          args: ProductDetailsRouteArgs(
            args: args,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'ProductDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ProductDetailsRouteArgs>();
      return ProductDetailsPage(
        args: args.args,
        key: args.key,
      );
    },
  );
}

class ProductDetailsRouteArgs {
  const ProductDetailsRouteArgs({
    required this.args,
    this.key,
  });

  final ProductDetailsPageArguments args;

  final Key? key;

  @override
  String toString() {
    return 'ProductDetailsRouteArgs{args: $args, key: $key}';
  }
}

/// generated route for
/// [ReferFriendPage]
class ReferFriendRoute extends PageRouteInfo<ReferFriendRouteArgs> {
  ReferFriendRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          ReferFriendRoute.name,
          args: ReferFriendRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'ReferFriendRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<ReferFriendRouteArgs>(
          orElse: () => const ReferFriendRouteArgs());
      return ReferFriendPage(key: args.key);
    },
  );
}

class ReferFriendRouteArgs {
  const ReferFriendRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'ReferFriendRouteArgs{key: $key}';
  }
}

/// generated route for
/// [RegisterPage]
class RegisterRoute extends PageRouteInfo<RegisterRouteArgs> {
  RegisterRoute({
    required RegisterPageArguments args,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          RegisterRoute.name,
          args: RegisterRouteArgs(
            args: args,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'RegisterRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<RegisterRouteArgs>();
      return RegisterPage(
        args: args.args,
        key: args.key,
      );
    },
  );
}

class RegisterRouteArgs {
  const RegisterRouteArgs({
    required this.args,
    this.key,
  });

  final RegisterPageArguments args;

  final Key? key;

  @override
  String toString() {
    return 'RegisterRouteArgs{args: $args, key: $key}';
  }
}

/// generated route for
/// [RequestSupportPage]
class RequestSupportRoute extends PageRouteInfo<void> {
  const RequestSupportRoute({List<PageRouteInfo>? children})
      : super(
          RequestSupportRoute.name,
          initialChildren: children,
        );

  static const String name = 'RequestSupportRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const RequestSupportPage();
    },
  );
}

/// generated route for
/// [SearchPage]
class SearchRoute extends PageRouteInfo<void> {
  const SearchRoute({List<PageRouteInfo>? children})
      : super(
          SearchRoute.name,
          initialChildren: children,
        );

  static const String name = 'SearchRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SearchPage();
    },
  );
}

/// generated route for
/// [SettingsPage]
class SettingsRoute extends PageRouteInfo<SettingsRouteArgs> {
  SettingsRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SettingsRoute.name,
          args: SettingsRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'SettingsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SettingsRouteArgs>(
          orElse: () => const SettingsRouteArgs());
      return SettingsPage(key: args.key);
    },
  );
}

class SettingsRouteArgs {
  const SettingsRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'SettingsRouteArgs{key: $key}';
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

/// generated route for
/// [StaticPage]
class StaticRoute extends PageRouteInfo<StaticRouteArgs> {
  StaticRoute({
    required StaticPageType pageType,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          StaticRoute.name,
          args: StaticRouteArgs(
            pageType: pageType,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'StaticRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<StaticRouteArgs>();
      return StaticPage(
        pageType: args.pageType,
        key: args.key,
      );
    },
  );
}

class StaticRouteArgs {
  const StaticRouteArgs({
    required this.pageType,
    this.key,
  });

  final StaticPageType pageType;

  final Key? key;

  @override
  String toString() {
    return 'StaticRouteArgs{pageType: $pageType, key: $key}';
  }
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

/// generated route for
/// [SubmitPhoneNumberPage]
class SubmitPhoneNumberRoute extends PageRouteInfo<SubmitPhoneNumberRouteArgs> {
  SubmitPhoneNumberRoute({
    required SubmitReceiverPageArguments args,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SubmitPhoneNumberRoute.name,
          args: SubmitPhoneNumberRouteArgs(
            args: args,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SubmitPhoneNumberRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SubmitPhoneNumberRouteArgs>();
      return SubmitPhoneNumberPage(
        args: args.args,
        key: args.key,
      );
    },
  );
}

class SubmitPhoneNumberRouteArgs {
  const SubmitPhoneNumberRouteArgs({
    required this.args,
    this.key,
  });

  final SubmitReceiverPageArguments args;

  final Key? key;

  @override
  String toString() {
    return 'SubmitPhoneNumberRouteArgs{args: $args, key: $key}';
  }
}

/// generated route for
/// [SuccessOrderingPage]
class SuccessOrderingRoute extends PageRouteInfo<SuccessOrderingRouteArgs> {
  SuccessOrderingRoute({
    required String orderId,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          SuccessOrderingRoute.name,
          args: SuccessOrderingRouteArgs(
            orderId: orderId,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'SuccessOrderingRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<SuccessOrderingRouteArgs>();
      return SuccessOrderingPage(
        orderId: args.orderId,
        key: args.key,
      );
    },
  );
}

class SuccessOrderingRouteArgs {
  const SuccessOrderingRouteArgs({
    required this.orderId,
    this.key,
  });

  final String orderId;

  final Key? key;

  @override
  String toString() {
    return 'SuccessOrderingRouteArgs{orderId: $orderId, key: $key}';
  }
}

/// generated route for
/// [VendorDetailsPage]
class VendorDetailsRoute extends PageRouteInfo<VendorDetailsRouteArgs> {
  VendorDetailsRoute({
    required VendorDetailsPageArguments args,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          VendorDetailsRoute.name,
          args: VendorDetailsRouteArgs(
            args: args,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'VendorDetailsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VendorDetailsRouteArgs>();
      return VendorDetailsPage(
        args: args.args,
        key: args.key,
      );
    },
  );
}

class VendorDetailsRouteArgs {
  const VendorDetailsRouteArgs({
    required this.args,
    this.key,
  });

  final VendorDetailsPageArguments args;

  final Key? key;

  @override
  String toString() {
    return 'VendorDetailsRouteArgs{args: $args, key: $key}';
  }
}

/// generated route for
/// [VendorProductsPage]
class VendorProductsRoute extends PageRouteInfo<VendorProductsRouteArgs> {
  VendorProductsRoute({
    required VendorDetailsPageArguments args,
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          VendorProductsRoute.name,
          args: VendorProductsRouteArgs(
            args: args,
            key: key,
          ),
          initialChildren: children,
        );

  static const String name = 'VendorProductsRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VendorProductsRouteArgs>();
      return VendorProductsPage(
        args: args.args,
        key: args.key,
      );
    },
  );
}

class VendorProductsRouteArgs {
  const VendorProductsRouteArgs({
    required this.args,
    this.key,
  });

  final VendorDetailsPageArguments args;

  final Key? key;

  @override
  String toString() {
    return 'VendorProductsRouteArgs{args: $args, key: $key}';
  }
}
