import 'dart:io';

import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/dialogs/confirmation_dialog.dart';
import 'package:trend/core/presentation/dialogs/show_custom_dialog.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/dependencies.dart';
import 'package:trend/features/home/presentation/widgets/home_navigation_bar.dart';

import 'package:trend/features/home/controllers/bottom_navigator_controller.dart';

@RoutePage()
class HomePageNavigation extends StatefulWidget {
  final HomeNavigationBarTileType? initialTile;
  const HomePageNavigation({super.key, this.initialTile});

  @override
  HomePageNavigationState createState() => HomePageNavigationState();
}

class HomePageNavigationState extends State<HomePageNavigation> with TickerProviderStateMixin {
  late TabController tabController;

  late BottomNavigatorController bottomNavigatorController;

  bool needToRefreshAppState = false;

  @override
  void initState() {
    super.initState();
    bottomNavigatorController = getIt<BottomNavigatorController>(param1: widget.initialTile ?? 0);
    tabController = TabController(length: 5, vsync: this, initialIndex: widget.initialTile?.order ?? 0);
  }

  Future<void> onPopPage(final bool didPop, final result) async {
    if (tabController.index != 0) {
      changeTab(0);
      return;
    }
    final bool result = await showCustomDialog(
            dialog: const ConfirmationDialog(
          mainActionText: 'Confirm',
          content: 'You are about closing the app!',
        )) ??
        false;
    if (result) {
      if (Platform.isAndroid) {
        await SystemNavigator.pop();
      } else {
        await SystemChannels.platform.invokeMethod('SystemNavigator.pop');
      }
    }
  }

  void changeTab(final int newIndex) {
    tabController.animateTo(newIndex);
    bottomNavigatorController.changeIndex(newIndex);
  }

  @override
  void didUpdateWidget(covariant final HomePageNavigation oldWidget) {
    tabController = TabController(length: 5, vsync: this, initialIndex: widget.initialTile?.order ?? 0);
    bottomNavigatorController.changeIndex(widget.initialTile?.order ?? 0);
    super.didUpdateWidget(oldWidget);
  }

  @override
  Widget build(final BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: onPopPage,
      child: Container(
        color: Colors.white,
        padding: EdgeInsets.only(bottom: 16.h),
        child: Scaffold(
          bottomNavigationBar: HomeNavigationBar(
            tabController: tabController,
            bottomNavigatorController: bottomNavigatorController,
          ),
          body: TabBarView(
            physics: const NeverScrollableScrollPhysics(),
            controller: tabController,
            children: HomeNavigationBarTileType.sortedValues.map((final e) => e.destination).toList(),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    tabController.dispose();
    super.dispose();
  }
}
