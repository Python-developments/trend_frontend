import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/widgets/custom_svg_image.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/features/home/controllers/bottom_navigator_controller.dart';

class HomeNavigationBar extends StatelessWidget {
  final TabController tabController;
  final BottomNavigatorController bottomNavigatorController;

  const HomeNavigationBar({
    required this.tabController,
    required this.bottomNavigatorController,
    super.key,
  });


  @override
  Widget build(final BuildContext context) {
    return Container(
      //key: ValueKey(getIt<LocalizationController>().isRtlLanguage),
      child: Observer(
        builder: (final context) => BottomNavigationBar(
              currentIndex: bottomNavigatorController.currentIndex,
          onTap:   (final index){
              tabController.animateTo(index);
              bottomNavigatorController.changeIndex(index);
              },
          backgroundColor: AppStyle.white,
          selectedItemColor: AppStyle.blue,
          unselectedLabelStyle: AppStyle.textTheme.labelSmall!.copyWith(
            color: AppStyle.black.shade500,
          ),
          selectedLabelStyle: AppStyle.textTheme.labelSmall!.copyWith(
            color: AppStyle.blue,
          ),
          type: BottomNavigationBarType.fixed,
          elevation: 0,
          items: [
            for (int i = 0; i < HomeNavigationBarTileType.sortedValues.length; i++)
              buildNavigationBarItem(i, i == bottomNavigatorController.currentIndex),
          ],
              )
      ),
    );
  }

  BottomNavigationBarItem buildNavigationBarItem(
      final int tileIndex, final bool isSelected) {
    final String currentImagePath = HomeNavigationBarTileType.sortedValues[tileIndex].iconPath;
    return BottomNavigationBarItem(
        icon: Padding(
            padding: EdgeInsets.only(bottom: 4.r),
            child:CustomSvgImage(
              path: currentImagePath,size: 20,
    color: isSelected
    ? AppStyle.black
        : AppStyle.black.shade400,
            )));}
}
