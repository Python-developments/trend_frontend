import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/widgets/shimmers/custom_shimmer_widget.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/core/utils/extensions.dart';

class ProductGridTileShimmer extends StatelessWidget {
  final double aspectRatio;
  const ProductGridTileShimmer({super.key, this.aspectRatio = 1.0});

  @override
  Widget build(final BuildContext context) {
    return DecoratedBox(
        decoration: BoxDecoration(
          boxShadow: AppStyle.boxShadow,
          borderRadius: AppStyle.borderRadius,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            CustomShimmerWidget(
              height: (context.deviceType == ClientDeviceType.phone
                      ? (174.r)
                      : 152.r) *
                  aspectRatio,
              width: (context.deviceType == ClientDeviceType.phone
                      ? (174.r)
                      : 152.r) *
                  aspectRatio,
            ),
            Expanded(
              child: Container(
                padding: EdgeInsets.all((8.h) * aspectRatio),
                decoration: BoxDecoration(
                    color: const Color(0xFFFBFBFB),
                    borderRadius: BorderRadius.vertical(
                        bottom: AppStyle.borderRadius.bottomLeft)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomShimmerWidget(height: 16 * aspectRatio, width: 92),
                    const Spacer(),
                    CustomShimmerWidget(height: 8 * aspectRatio, width: 52),
                  ],
                ),
              ),
            )
          ],
        ));
  }
}
