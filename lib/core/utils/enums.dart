// ignore_for_file: constant_identifier_names

import 'package:flutter/material.dart';
import 'package:trend/features/add_post/presentation/add_new_post_page.dart';
import 'package:trend/features/notifications/presentation/pages/notifications.dart';

enum ToastType { success, error }

enum RequestMethod { get, delete, post, patch, put }

enum ClientDeviceType { phone, tablet, largerDevice }

enum FieldPriority { required, optional, optionalHidden }

enum HomeNavigationBarTileType {
  wowvir(order: 0, iconPath: 'assets/icons/home_icon.svg', destination: AddNewPostPage()),
  search(order: 1, iconPath: 'assets/icons/search.svg', destination: AddNewPostPage()),
  newPost(order: 2, iconPath: 'assets/icons/plus-circle.svg', destination: AddNewPostPage()),
  notifications(order: 3, iconPath: 'assets/icons/bell.svg', destination: NotificationsPage()),
  profile(order: 4, iconPath: 'assets/icons/person.svg', destination: AddNewPostPage());

  final String iconPath;
  final int order;
  final Widget destination;
  const HomeNavigationBarTileType({required this.iconPath, required this.order, required this.destination});

  static List<HomeNavigationBarTileType> get sortedValues =>
      List.of(HomeNavigationBarTileType.values)..sort((final a, final b) => a.order.compareTo(b.order));
}
