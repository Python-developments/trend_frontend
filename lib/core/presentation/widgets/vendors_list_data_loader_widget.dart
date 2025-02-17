import 'package:flutter/material.dart';
import 'package:trend/core/controllers/vendors_controller.dart';
import 'package:trend/core/presentation/widgets/custom_animated_pagination_list_data_loader_widget.dart';
import 'package:trend/core/presentation/widgets/vendor_tile.dart';
import 'package:trend/data/models/vendors/vendor_model.dart';
import 'package:trend/features/search/controllers/vendors_search_controller.dart';

import 'package:trend/core/presentation/widgets/shimmers/vendor_tile_shimmer.dart';

class VendorsListDataLoaderWidget extends StatelessWidget {
  final VendorsController vendorsController;
  const VendorsListDataLoaderWidget(
      {required this.vendorsController, super.key});

  @override
  Widget build(final BuildContext context) {
    return CustomAnimatedPaginationListDataLoaderWidget<VendorModel>(
        loadingWidget: const VendorTileShimmer(),
        loadingWidgetChildrenCount: 3,
        dataLoader: vendorsController,
        spacerHeight: 12,
        dataToWidgetMapper: (final vendor) => VendorTile(
              vendor: vendor,
              isSearchPage: vendorsController is VendorsSearchController,
            ));
  }
}
