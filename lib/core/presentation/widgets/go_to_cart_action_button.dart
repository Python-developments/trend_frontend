import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/widgets/custom_svg_image.dart';
import 'package:trend/core/controllers/cart_controller.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/assets.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/core/utils/mixins.dart';
import 'package:trend/data/models/cart/cart_item_model.dart';

class GoToCartActionButton extends StatelessWidget
    with WidgetControllerCreatorMixin<CartController> {
  GoToCartActionButton({super.key});

  int calculateTotalItems(final List<CartItemModel> cartItems ) {
    int totalCount = 0;
    for (var item in cartItems) {
      totalCount += item.quantity;
    }
    return totalCount;
  }

  @override
  Widget build(final BuildContext context) {

    return Observer(
        builder: (final _) =>
             Visibility(
               visible: createdController.cartItems.isNotEmpty,
               child: GestureDetector(
                  onTap: () => getAppRouter.replaceAll([HomeRouteNavigation(initialTile: HomeNavigationBarTileType.cart)]),
                  child: Container(
                      padding: EdgeInsets.all(8.r),
                      decoration: BoxDecoration(
                          gradient: AppStyle.gradient,
                          borderRadius: BorderRadius.circular(8.r)),
                      child: Stack(
                        children: [
                          Padding(
                            padding: EdgeInsets.all(4.h),
                            child: const CustomSvgImage(
                              path: Assets.cart,
                              size: 32,
                              color: AppStyle.white,
                            ),
                          ),
                          Positioned(
                            top: 0,
                            right: 0,
                            child: CircleAvatar(
                              backgroundColor: AppStyle.errorColor,
                              radius: 8.r,
                              child: Text(
                                calculateTotalItems(createdController.cartItems).toString(),
                                style: AppStyle.textTheme.bodySmall!.copyWith(
                                    color: AppStyle.white,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ),
                        ],
                      )),
                ),
             )
            );
  }
}
