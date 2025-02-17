import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/utils/extensions.dart';

class CustomTabBar extends StatelessWidget {
  final List<String> titles;
  final TabController? controller;
  final bool isScrollable;

  const CustomTabBar(
      {required this.titles,
      required this.isScrollable,
      super.key,
      this.controller});

  @override
  Widget build(final BuildContext context) {
    return TabBar(
      tabAlignment: isScrollable ? TabAlignment.start : null,
      controller: controller,
      isScrollable: isScrollable,
      indicatorSize: TabBarIndicatorSize.label,
      indicatorColor: AppStyle.blue,
      unselectedLabelColor: AppStyle.black.shade500,
      labelColor: AppStyle.blue,
      unselectedLabelStyle: AppStyle.textTheme.bodyLarge,
      labelStyle:
          AppStyle.textTheme.bodyLarge!.copyWith(fontWeight: FontWeight.w600),
      labelPadding: EdgeInsets.symmetric(horizontal: 8.w),
      dividerColor: Colors.transparent,
      tabs: [
        for (int i = 0; i < titles.length; i++)
          Tab(
            iconMargin: EdgeInsets.zero,
            text: titles[i],
            height: 30.h,
          ),
      ],
    );
  }
}
