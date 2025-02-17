import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/arguments/product_details_page_arguments.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/core/presentation/snake_bars/bottom_snack_bar.dart';
import 'package:trend/core/presentation/snake_bars/snack_bar_messages.dart';
import 'package:trend/core/presentation/widgets/custom_network_image.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/core/utils/extensions.dart';
import 'package:trend/data/local_database/databases/abstract/i_app_local_database.dart';
import 'package:trend/data/local_database/entities/product_entity.dart';
import 'package:trend/data/models/products/product_model.dart';

import 'package:trend/dependencies.dart';

class ProductGridTile extends StatefulWidget {
  final ProductModel product;
  final ProductGridViewType gridViewType;
  final String? subcategoryName;
  final VendorStatus vendorStatus;
  final double aspectRatio;
  final int? animationDelayIndex;
  final void Function()? productsPageRefresher;

  const ProductGridTile({
    required this.product,
    required this.animationDelayIndex,
    required this.vendorStatus,
    required this.gridViewType,
    required this.productsPageRefresher,
    this.aspectRatio = 1,
    this.subcategoryName,
    super.key,
  });

  @override
  ProductGridTileState createState() => ProductGridTileState();
}

class ProductGridTileState extends State<ProductGridTile>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<Offset> _slideAnimation;
  late Animation<double> _opacityAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      value: widget.animationDelayIndex == null ? 1 : 0,
      vsync: this,
      duration: Duration(
          milliseconds: 300 + (min(widget.animationDelayIndex ?? 0, 6) * 100)),
    );
    _slideAnimation = Tween<Offset>(
      begin:
          Offset(0, -1*(0.1 + (((min(widget.animationDelayIndex ?? 0, 6)) * 0.02)))),
      end: Offset.zero,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
    _opacityAnimation = Tween<double>(
      begin: 0.3,
      end: 1.0,
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.linear,
      ),
    );
    _controller.forward();
  }

  @override
  Widget build(final BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (final _, final __) => Opacity(
        opacity: _opacityAnimation.value
            .clamp(0.0, 1.0), // Ensure opacity stays within the valid range
        child: SlideTransition(
          position: _slideAnimation,
          child: GestureDetector(
            onTap: () {
              if(widget.vendorStatus==VendorStatus.BUSY_30_MIN ||widget.vendorStatus==VendorStatus.BUSY_60_MIN  ) {
                getIt<SnakeBarShower>().showSnakeBar(
                    'Oops, It seems this vendor is busy for now'.translateWord, ToastType.error);
              }
              else if(widget.vendorStatus==VendorStatus.CLOSED  ) {
                getIt<SnakeBarShower>().showSnakeBar(
                    'Oops, It seems this vendor has closed for now.'.translateWord, ToastType.error);
              }
              else if (widget.product.stockStatus == ProductStockStatus.outOfStock) {
               getIt<SnakeBarShower>().showSnakeBar(
                    SnakeBarMessages.unavailableProduct.translateWord, ToastType.error);

              }
              else if (widget.gridViewType == ProductGridViewType.search) {
                getIt<IAppLocalDatabase>().insertProduct(
                    ProductEntity.fromProductModel(
                        widget.product, ProductsCacheType.search));
              }
              else {
              final ProductDetailsRoute newPageArgs = ProductDetailsRoute(
                  args: ProductDetailsPageArguments(
                productId: widget.product.id,
                defaultImage: widget.product.imageUrl,
                productsPageRefresher: widget.productsPageRefresher,
                initialItemIndex: widget.product.initialItemIndex,
                heroTag: widget.product.imageUrl != null
                    ? widget.product.imageUrl! + (widget.subcategoryName ?? '')
                    : null,
              ));
              if (widget.gridViewType == ProductGridViewType.similar) {
                getAppRouter.popAndPush(newPageArgs);
              } else {
                getAppRouter.push(newPageArgs);
              }
              }
            },
            child: DecoratedBox(
              /*width: (174.r) * widget.aspectRatio,*/
              decoration: BoxDecoration(
                boxShadow: AppStyle.boxShadow,
                color: AppStyle.white,
                borderRadius: AppStyle.borderRadius,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                top: AppStyle.borderRadius.topLeft),
                          gradient: LinearGradient(

                              begin:Alignment.topCenter,
                              end:Alignment.bottomCenter,
                              colors: [ Color(0xFFCAD7E1),Color(0xFFDDE5EB)],

                          )
                        ),
                        height: (context.deviceType==ClientDeviceType.phone? (174.r):152.r) * widget.aspectRatio,
                        width: double.infinity,
                      child: CustomNetworkImage(
                        heroTag: widget.product.imageUrl != null
                            ? widget.product.imageUrl! +
                                (widget.subcategoryName ?? '')
                            : null,
                        imagePath: widget.product.imageUrl,
                        radius: BorderRadius.vertical(
                            top: AppStyle.borderRadius.topLeft),

                      )),
                      if (widget.product.stockStatus ==
                          ProductStockStatus.outOfStock)
                        Container(
                          height: (context.deviceType == ClientDeviceType.phone
                                  ? (174.r)
                                  : 152.r) *
                              widget.aspectRatio,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.vertical(
                                top: AppStyle.borderRadius.topLeft),
                            color: Colors.black38,
                          ),
                          child: Center(
                            child: Text(
                              'Out of stock'.translateWord,
                              style: AppStyle.textTheme.bodyLarge!.copyWith(
                                fontSize:
                                    AppStyle.textTheme.bodyLarge!.fontSize! *
                                        widget.aspectRatio,
                                color: AppStyle.white,
                              ),
                            ),
                          ),
                        )
                    ],
                  ),
                  Expanded(
                    child: Container(
                      /*height: (88.r) * widget.aspectRatio,
                      width: (174.r) * widget.aspectRatio,*/
                      padding: EdgeInsets.all((8.r) * widget.aspectRatio),
                      decoration: BoxDecoration(
                          color: const Color(0xFFFBFBFB),
                          borderRadius: BorderRadius.vertical(
                              bottom: AppStyle.borderRadius.bottomLeft)),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            children: [
                              Text(
                                widget.product.name,
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: AppStyle.textTheme.bodySmall!.copyWith(
                                  fontSize:
                                      AppStyle.textTheme.bodySmall!.fontSize! *
                                          widget.aspectRatio,
                                ),
                              ),
                            ],
                          ),
                          if (widget.product.discountPrice != null)
                            Row(
                              children: [
                                Text(
                                  widget.product.discountPrice!.currency,
                                  style: AppStyle.textTheme.labelSmall!
                                      .copyWith(
                                          fontSize:
                                              AppStyle.textTheme.labelSmall!
                                                      .fontSize! *
                                                  widget.aspectRatio,
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationThickness: 0.5,
                                          decorationColor: AppStyle.black,
                                          color: AppStyle.black.shade600),
                                ),
                                const CustomSizedBox(
                                  width: 4,
                                ),
                                Text(
                                  '${((widget.product.discountPrice! - widget.product.originalPrice) * 100 / widget.product.discountPrice!).toStringAsFixed(0)}%',
                                  overflow: TextOverflow.ellipsis,
                                  style: AppStyle.textTheme.labelSmall!
                                      .copyWith(
                                          fontSize: AppStyle.textTheme
                                                  .labelSmall!.fontSize! *
                                              widget.aspectRatio,
                                          color: AppStyle.lightPrimaryColor),
                                ),
                              ],
                            ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                widget.product.originalPrice.currency,
                                style: AppStyle.textTheme.bodySmall!.copyWith(
                                    fontSize: AppStyle
                                            .textTheme.bodySmall!.fontSize! *
                                        widget.aspectRatio,
                                    fontWeight: FontWeight.bold,
                                    color: AppStyle.black),
                              ),
                              const CustomSizedBox(
                                width: 4,
                              ),
                              if (widget.product.subtitle != null)
                                Expanded(
                                  child: Text(
                                    widget.product.subtitle!,
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    textAlign: TextAlign.end,
                                    style: AppStyle.textTheme.labelSmall!
                                        .copyWith(
                                            fontSize: AppStyle.textTheme
                                                    .labelSmall!.fontSize! *
                                                widget.aspectRatio,
                                            fontWeight: FontWeight.bold,
                                            color: AppStyle.black.shade600),
                                  ),
                                ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
