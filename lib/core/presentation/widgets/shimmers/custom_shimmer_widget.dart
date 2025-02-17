import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';

class CustomShimmerWidget extends StatelessWidget {
  final double height, width;
  final BoxShape shape;

  const CustomShimmerWidget(
      {required this.height,
      required this.width,
      this.shape = BoxShape.rectangle,
      super.key});

  @override
  Widget build(final BuildContext context) {
    return Shimmer.fromColors(
      highlightColor: AppStyle.black.shade100.withOpacity(0.2),
      baseColor: AppStyle.lightGray,
      period: const Duration(milliseconds: 800),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: AppStyle.white,
          borderRadius:
              shape == BoxShape.rectangle ? AppStyle.borderRadius : null,
          shape: shape,
          boxShadow: AppStyle.boxShadow,
        ),
        child: CustomSizedBox(
          height: height,
          width: width,
        ),
      ),
    );
  }
}
