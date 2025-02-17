import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';
import 'package:trend/core/presentation/widgets/shimmers/custom_shimmer_widget.dart';

class VendorTileShimmer extends StatelessWidget {
  const VendorTileShimmer({super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        DecoratedBox(
          decoration: BoxDecoration(
            borderRadius: AppStyle.borderRadius,
            boxShadow: AppStyle.boxShadow,
            color: AppStyle.white,
          ),
          child: Column(
            children: [
              const CustomShimmerWidget(height: 154, width: double.infinity),
              Container(
                  padding:
                      EdgeInsets.symmetric(horizontal: 12.w, vertical: 8.h),
                  decoration: BoxDecoration(
                    color: AppStyle.white,
                    borderRadius: BorderRadius.vertical(
                        bottom: AppStyle.borderRadius.bottomLeft),
                  ),
                  child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        CustomShimmerWidget(height: 12, width: 164),
                        CustomSizedBox(
                          height: 12,
                        ),
                        Row(
                          children: [
                            CustomShimmerWidget(height: 8, width: 72),
                            Spacer(),
                            CustomShimmerWidget(height: 8, width: 92),
                          ],
                        )
                      ])),
              const CustomSizedBox(
                height: 8,
              ),
            ],
          ),
        ),
        const CustomSizedBox(
          height: 7,
        ),
      ],
    );
  }
}
