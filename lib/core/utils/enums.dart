// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/assets.dart';

enum ToastType { success, error }

enum RequestMethod { get, delete, post, patch, put }

enum ClientDeviceType { phone, tablet, largerDevice }

enum HomeNavigationBarTileType {
  wowvir(name: 'Home', order: 0, iconPath: Assets.wowvir, destination: BannersPage()),
  search(name: 'Search', order: 1, iconPath: Assets.search, destination: SearchPage()),
  events(name: 'Special Days', order: 2, iconPath: Assets.calender, destination: EventsPage()),
  cart(name: 'Cart', order: 3, iconPath: Assets.cart, destination: CartPage()),
  profile(name: 'Profile', order: 4, iconPath: Assets.myAccount, destination: MyProfilePage());

  final String name, iconPath;
  final int order;
  final Widget destination;
  const HomeNavigationBarTileType(
      {required this.name, required this.iconPath, required this.order, required this.destination});

  static List<HomeNavigationBarTileType> get sortedValues =>
      List.of(HomeNavigationBarTileType.values)..sort((final a, final b) => a.order.compareTo(b.order));
}
