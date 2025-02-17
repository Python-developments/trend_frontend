import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/widgets/shimmers/product_grid_tile_shimmer.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/core/utils/extensions.dart';

class ProductGridViewShimmer extends StatelessWidget {
  final EdgeInsets padding;
  const ProductGridViewShimmer({required this.padding, super.key});

  @override
  Widget build(final BuildContext context) {
    return GridView(
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent:
              (context.deviceType == ClientDeviceType.phone ? (174.r) : 152.r),
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          mainAxisExtent:
              ((((context.deviceType == ClientDeviceType.phone ? (174) : 152)) +
                      64)
                  .r),
        ),
        padding: padding,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          for (int i = 0; i < 6; i++) const ProductGridTileShimmer(),
        ]);
  }
}
