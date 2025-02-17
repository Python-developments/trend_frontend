import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:trend/core/presentation/arguments/address_details_page_arguments.dart';
import 'package:trend/core/presentation/arguments/confirm_otp_page_arguments.dart';
import 'package:trend/core/presentation/arguments/event_details_page_arguments.dart';
import 'package:trend/core/presentation/arguments/login_page_arguments.dart';
import 'package:trend/core/presentation/arguments/map_location_selection_page_arguments.dart';
import 'package:trend/core/presentation/arguments/map_location_viewer_page_arguments.dart';
import 'package:trend/core/presentation/arguments/order_negative_request_page_arguments.dart';
import 'package:trend/core/presentation/arguments/order_tracking_page_arguments.dart';
import 'package:trend/core/presentation/arguments/product_details_page_arguments.dart';
import 'package:trend/core/presentation/arguments/register_page_arguments.dart';
import 'package:trend/core/presentation/arguments/submit_new_password_arguments.dart';
import 'package:trend/core/presentation/arguments/submit_receiver_page_arguments.dart';
import 'package:trend/core/presentation/arguments/vendor_products_page_arguments.dart';
import 'package:trend/core/presentation/pages/map_location_selection_page.dart';
import 'package:trend/core/presentation/pages/map_location_viewer_page.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/models/primary_banner_model.dart';
import 'package:trend/dependencies.dart';
import 'package:trend/features/addresses/presentation/pages/address_details_page.dart';
import 'package:trend/features/addresses/presentation/pages/addresses_page.dart';
import 'package:trend/features/app/presentation/pages/app_error_page.dart';
import 'package:trend/features/app/presentation/pages/splash_screen_page.dart';
import 'package:trend/features/auth/presentation/pages/confirm_receiver_page.dart';
import 'package:trend/features/auth/presentation/pages/login_page.dart';
import 'package:trend/features/auth/presentation/pages/register_page.dart';
import 'package:trend/features/auth/presentation/pages/submit_email_page.dart';
import 'package:trend/features/auth/presentation/pages/submit_new_password_page.dart';
import 'package:trend/features/auth/presentation/pages/submit_phone_number_page.dart';
import 'package:trend/features/categories/presentation/pages/category_vendors_page.dart';
import 'package:trend/features/customer_support/presentation/pages/join_as_vendor_page.dart';
import 'package:trend/features/customer_support/presentation/pages/request_support_page.dart';
import 'package:trend/features/checkout/presentation/pages/checkout_page.dart';
import 'package:trend/features/checkout/presentation/pages/success_ordering_page.dart';
import 'package:trend/features/events/presentation/pages/event_details_page.dart';
import 'package:trend/features/favorites/presentation/pages/favorites_page.dart';
import 'package:trend/features/home/presentation/pages/address_selection_page.dart';
import 'package:trend/features/home/presentation/pages/home_page_navigation.dart';
import 'package:trend/features/home/presentation/pages/primary_banner_vendors_page.dart';
import 'package:trend/features/orders/presentation/pages/order_details_page.dart';
import 'package:trend/features/orders/presentation/pages/order_negative_request_page.dart';
import 'package:trend/features/orders/presentation/pages/order_tracking_page.dart';
import 'package:trend/features/orders/presentation/pages/orders_page.dart';
import 'package:trend/features/products/presentation/pages/product_details_page.dart';
import 'package:trend/features/profile/presentation/pages/edit_profile_page.dart';
import 'package:trend/features/profile/presentation/pages/notifications_page.dart';
import 'package:trend/features/profile/presentation/pages/refer_friend_page.dart';
import 'package:trend/features/profile/presentation/pages/settings_page.dart';
import 'package:trend/features/profile/presentation/pages/static_page.dart';
import 'package:trend/features/search/presentation/pages/search_page.dart';
import 'package:trend/features/vendors/presentation/pages/vendor_details_page.dart';
import 'package:trend/features/vendors/presentation/pages/vendor_products_page.dart';

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
        AutoRoute(page: SubmitPhoneNumberRoute.page,),
        AutoRoute(page: EditProfileRoute.page,),
        AutoRoute(page: SubmitEmailRoute.page,),
        AutoRoute(page: SettingsRoute.page,),
        AutoRoute(page: NotificationsRoute.page,),
        AutoRoute(page: ReferFriendRoute.page,),
        AutoRoute(page: OrderDetailsRoute.page,),
        AutoRoute(page: VendorDetailsRoute.page,),
        AutoRoute(page: VendorProductsRoute.page,),
        AutoRoute(page: EventDetailsRoute.page,),
        AutoRoute(page: AddressesRoute.page,),
        AutoRoute(page: AddressDetailsRoute.page,),
        AutoRoute(page: CategoryVendorsRoute.page,),
        AutoRoute(page: ProductDetailsRoute.page,),
        AutoRoute(page: CheckoutRoute.page,),
        AutoRoute(page: MapLocationSelectionRoute.page,),
        AutoRoute(page: MapLocationViewerRoute.page,),
        AutoRoute(page: SuccessOrderingRoute.page,),
        AutoRoute(page: StaticRoute.page,),
        AutoRoute(page: AddressSelectionRoute.page,),
        AutoRoute(page: SearchRoute.page,),
        AutoRoute(page: FavoritesRoute.page,),
        AutoRoute(page: AppErrorRoute.page,),
        AutoRoute(page: OrderTrackingRoute.page,),
        AutoRoute(page: OrderNegativeRequestRoute.page,),
        AutoRoute(page: PrimaryBannerVendorsRoute.page,),
        AutoRoute(page: RequestSupportRoute.page,),
        AutoRoute(page: JoinAsVendorRoute.page,),
        AutoRoute(page: OrdersRoute.page,),
      ];
}

@module
abstract class AppRouterModule {
  @singleton

  AppRouter get getAppRouter => AppRouter();
}

AppRouter getAppRouter =getIt<AppRouter>();
