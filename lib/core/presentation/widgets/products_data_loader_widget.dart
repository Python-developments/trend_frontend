import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/controllers/products_controller.dart';
import 'package:trend/core/presentation/widgets/custom_pagination_list_data_loader_widget.dart';
import 'package:trend/core/presentation/widgets/product_grid_view.dart';
import 'package:trend/core/presentation/widgets/shimmers/product_grid_view_shimmer.dart';
import 'package:trend/core/utils/enums.dart';

class ProductsDataLoaderWidget extends StatelessWidget {
  final ProductsController productsController;
  final VendorStatus vendorStatus;
  final EdgeInsets? padding;
  const ProductsDataLoaderWidget(
      {required this.vendorStatus,
      required this.productsController,
      super.key,
      this.padding});

  @override
  Widget build(final BuildContext context) {
    return CustomPaginationListDataLoaderWidget(
        padding: EdgeInsets.zero,
        dataLoader: productsController,
        loadingWidget: ProductGridViewShimmer(padding: EdgeInsets.all(8.r)),
        scrolledDataToWidgetMapper: (final products,final scrollController) => SizedBox(
              height: 0.8.sh,
              child: ProductGridView(
                  scrollController:scrollController,
                  products: products,
                  vendorStatus: vendorStatus,
                  productsPageRefresher: productsController.loadData,
                  gridViewType: ProductGridViewType.normal,
                  padding:  EdgeInsets.all( 8.r)),
            ));
  }
}
