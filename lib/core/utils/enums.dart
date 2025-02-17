// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/assets.dart';
import 'package:trend/features/cart/presentation/pages/cart_page.dart';
import 'package:trend/features/events/presentation/pages/events_page.dart';
import 'package:trend/features/home/presentation/pages/banners_page.dart';
import 'package:trend/features/profile/presentation/pages/my_profile_page.dart';
import 'package:trend/features/search/presentation/pages/search_page.dart';

enum ToastType { success, error }

enum RequestMethod { get, delete, post, patch, put }

enum ApplicationState { stable, canUpdate, mustUpdate }

enum FieldPriority { required, optional, optionalHidden }

@JsonEnum(fieldRename: FieldRename.pascal)
enum GenderType { male, female }

enum ProductsSortType { priceLowestToHighest, priceHighestToLowest, newestToOldest }

enum DatePickerType { popup, circular }

enum SearchCacheType { products, vendors }

enum ProductsCacheType { favorites, search,vendorListing }

@JsonEnum(fieldRename: FieldRename.pascal)
enum ProductPreparationTimeUnit { hours, days, minutes }

enum VendorStatus { OPEN, CLOSED, BUSY_30_MIN, BUSY_60_MIN }

@JsonEnum(fieldRename: FieldRename.pascal)
enum BannerType { shopList, advertisement }

@JsonEnum(fieldRename: FieldRename.pascal)
enum ProductStockStatus { inStock, outOfStock }

enum StaticPageType { termsAndConditions, aboutUs, privacyPolicy }

enum SupportRequestType {
  account,
  order,
  payment,
  delivery,
  technical,
  others,
}

enum DayShortcut {
  monday(shortcutName: 'mon'),
  tuesday(shortcutName: 'tue'),
  wednesday(shortcutName: 'wed'),
  thursday(shortcutName: 'thu'),
  friday(shortcutName: 'fri'),
  saturday(shortcutName: 'sat'),
  sunday(shortcutName: 'sun');

  final String shortcutName;
  const DayShortcut({required this.shortcutName});
}

enum CouponState { entering, loading, applied, wrong }

enum OrderDeliveryBy { WowVir,Vendor,pickUp }

enum PaymentType { cashOnDelivery, newCard, existedCard, platformPayment }

enum OtpVerificationType { email, phone }

enum OrderNotificationType {
  orderPlaced,
  orderPreparing,
  orderOutForDelivery,
  orderCompleted,
  orderCanceled,
  orderScheduleConfirmed,
  orderPickupConfirmed,
}

enum NotificationsProviderType { firebase, huawei }

enum ProductGridViewType { normal, search, similar }

enum ClientDeviceType { phone, tablet, largerDevice }

enum VendorBannerType { shopCoverImage, shopOriginalLogo }

enum ChipState { unselected, selected, disabled }

enum CategoryExtension{FL,CK,CH,PR}

enum OrderStatus {
  draft(statusColor: AppStyle.starsColor, shortcutName: 'pending', isActive: false),
  pendingPayment(statusColor: AppStyle.starsColor, shortcutName: 'pending', isActive: false),
  paymentFailed(statusColor: AppStyle.starsColor, shortcutName: 'paymentFailed', isActive: false),
  pendingRejectionApproval(statusColor: AppStyle.starsColor, shortcutName: 'pending', isActive: false),
  pendingShopApproval(statusColor: AppStyle.starsColor, shortcutName: 'pending', isActive: true),
  scheduled(statusColor: AppStyle.lightPrimaryColor, shortcutName: 'scheduled', isActive: true),
  preparing(statusColor: AppStyle.starsColor, shortcutName: 'preparing', isActive: true),
  readyForPickup(statusColor: AppStyle.starsColor, shortcutName: 'readyForPickup', isActive: true),
  outForDelivery(statusColor: AppStyle.lightPrimaryColor, shortcutName: 'outForDelivery', isActive: true),
  completed(statusColor: AppStyle.confirmationColor, shortcutName: 'completed', isActive: false),
  canceled(statusColor: AppStyle.errorColor, shortcutName: 'canceled', isActive: false),
  rejected(statusColor: AppStyle.errorColor, shortcutName: 'rejected', isActive: false);

  final Color statusColor;
  final String shortcutName;
  final bool isActive;
  const OrderStatus({required this.statusColor, required this.shortcutName, required this.isActive});
}

enum OrderType {
  onDemandDelivery(shortcutName: 'Delivery', trackingPlan: [
    OrderStatus.pendingShopApproval,
    OrderStatus.preparing,
    OrderStatus.readyForPickup,
    OrderStatus.outForDelivery,
    OrderStatus.completed
  ]),
  pickUp(
      shortcutName: 'Pick up',
      trackingPlan: [OrderStatus.pendingShopApproval, OrderStatus.preparing, OrderStatus.readyForPickup, OrderStatus.completed]),
  scheduledDelivery(shortcutName: 'Scheduled', trackingPlan: [
    OrderStatus.pendingShopApproval,
    OrderStatus.scheduled,
    OrderStatus.preparing,
    OrderStatus.readyForPickup,
    OrderStatus.outForDelivery,
    OrderStatus.completed
  ]);

  final String shortcutName;
  final List<OrderStatus> trackingPlan;
  const OrderType({required this.shortcutName, required this.trackingPlan});
}

enum SupportedLanguage {
  english(languageName: 'English', languageCode: 'en', isRtlLanguage: false),
  arabic(languageName: 'العربية', languageCode: 'ar', isRtlLanguage: true);

  final String languageName, languageCode;
  final bool isRtlLanguage;
  const SupportedLanguage({required this.languageName, required this.languageCode, required this.isRtlLanguage});
}

enum SupportType { cancellation, complaint }

enum HomeNavigationBarTileType{

  wowvir(name:'Home',order:0,iconPath:Assets.wowvir,destination: BannersPage()),
  search(name:'Search',order:1,iconPath: Assets.search,destination: SearchPage()),
  events(name:'Special Days',order:2,iconPath: Assets.calender,destination: EventsPage()),
  cart(name:'Cart',order:3,iconPath: Assets.cart,destination: CartPage()),
  profile(name:'Profile',order:4,iconPath: Assets.myAccount,destination: MyProfilePage());



  final String name,iconPath;
  final int order;
  final Widget destination;
  const HomeNavigationBarTileType({required this.name, required this.iconPath, required this.order,required this.destination});

  static List<HomeNavigationBarTileType> get sortedValues=>List.of(HomeNavigationBarTileType.values)..sort(
          (final a,final b)=>a.order.compareTo(b.order));
}
