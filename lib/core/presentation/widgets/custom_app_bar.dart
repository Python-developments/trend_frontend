import 'package:flutter/material.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';
import 'package:trend/core/presentation/widgets/horizontal_arrow_icon.dart';
import 'package:trend/core/utils/extensions.dart';

class CustomAppBar extends AppBar {
  final String barTitle;
  final BuildContext context;
  final List<Widget> barActions;
  CustomAppBar(
      {required this.barTitle,
      required this.context,
      super.key,
      this.barActions = const []})
      : super(
            elevation: 0,
            titleSpacing: getAppRouter.canPop() ? 0 : null,
            scrolledUnderElevation: 0,
            flexibleSpace: Container(
              decoration: BoxDecoration(
                color: AppStyle.white ,
              ),
            ),
            leading: getAppRouter.canPop()
                ? HorizontalArrowIcon(
                    size: 24,
                    onTap: getAppRouter.maybePop,
                    color: isColorfulBar
                        ? AppStyle.white
                        : AppStyle.black.shade900)
                : null,
            title: Row(
              children: [
                Expanded(
                  child: Text(
                    barTitle,
                    style: AppStyle.textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: isColorfulBar
                            ? AppStyle.white
                            : AppStyle.black.shade900),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ),
              ],
            ),
            actions: [
              for (int i = 0; i < barActions.length; i++) ...[
                barActions[i],
                const CustomSizedBox(
                  width: 16,
                )
              ]
            ]);
}
