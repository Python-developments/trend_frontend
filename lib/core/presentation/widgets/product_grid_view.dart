import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/core/utils/extensions.dart';
import 'package:trend/data/models/products/product_model.dart';

import 'package:trend/core/presentation/widgets/product_grid_tile.dart';

class ProductGridView extends StatelessWidget {
  final List<ProductModel> products;
  final VendorStatus vendorStatus;
  final ProductGridViewType gridViewType;
  final void Function()? productsPageRefresher;
  final EdgeInsets padding;
  final String? subcategoryName;
  final ScrollPhysics? physics;
  final ScrollController? scrollController;
  const ProductGridView(
      {required this.products,
      required this.vendorStatus,
      required this.productsPageRefresher,
      required this.gridViewType,
      required this.padding,
      this.physics,
      this.subcategoryName,
      this.scrollController,
      super.key});

  @override
  Widget build(final BuildContext context) {
    return GridView.builder(
        controller: scrollController,
        shrinkWrap: true,
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent:
              (context.deviceType == ClientDeviceType.phone ? (180.r) : 152.r),
          crossAxisSpacing: 12.w,
          mainAxisSpacing: 12.h,
          mainAxisExtent:
              ((((context.deviceType == ClientDeviceType.phone ? (180) : 152)) +
                      74)
                  .r),
        ),
        padding: padding,
        physics: physics,
        itemCount: products.length,
        itemBuilder: (final _,final i)=> ProductGridTile(
              product: products[i],
              animationDelayIndex: i,
              gridViewType: gridViewType,
              vendorStatus: vendorStatus,
              productsPageRefresher: productsPageRefresher,
              subcategoryName: subcategoryName,
            ),
        );
  }
}
