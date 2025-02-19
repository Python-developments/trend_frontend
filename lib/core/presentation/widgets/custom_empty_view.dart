import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/widgets/custom_svg_image.dart';
import 'package:trend/core/controllers/base_controller.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';
import 'package:trend/core/presentation/widgets/main_button.dart';

class CustomEmptyView extends StatelessWidget {
  final BaseController controller;
  const CustomEmptyView({required this.controller, super.key});

  @override
  Widget build(final BuildContext context) {
    final (String, void Function())? helperButton = controller.errorButton;
    return RefreshIndicator(
      onRefresh: () async => controller.loadData(),
      child: Stack(
        children: [
          SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Container(
                  height: 512.h,
                )
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                CustomSvgImage(path: controller.error!.errorImage!, size: 164),
                const CustomSizedBox(
                  height: 16,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Text(controller.error!.errorMessage,
                      textAlign: TextAlign.center,
                      style: AppStyle.textTheme.titleSmall!
                          .copyWith(color: AppStyle.black.shade600)),
                ),
                const CustomSizedBox(
                  height: 16,
                ),
                if (helperButton != null)
                  Center(
                    child: MainButton(
                        title: helperButton.$1,
                        isLoading: controller.isLoading,
                        onPressed: helperButton.$2),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
