import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/widgets/custom_animated_text.dart';
import 'package:trend/core/presentation/widgets/custom_cross_fade_widget.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';
import 'package:trend/core/utils/extensions.dart';
import 'package:trend/data/models/orders/order_summary_model.dart';

class OrderSummaryCard extends StatelessWidget {
  final OrderSummaryModel orderSummary;
  final List<(String, num)>? additionalInfo;
  const OrderSummaryCard(
      {required this.orderSummary, this.additionalInfo, super.key});

  @override
  Widget build(final BuildContext context) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              'Order Summary'.translateWord,
              style: AppStyle.textTheme.bodyMedium!.copyWith(
                  color: AppStyle.black.shade900, fontWeight: FontWeight.bold),
            ),
            const CustomSizedBox(
              height: 8,
            ),
            for ((String, num) singleInfo in (additionalInfo ?? [])) ...[
              buildSummaryTile(
                singleInfo.$1,
                singleInfo.$2.currency,
              ),
              const CustomSizedBox(
                height: 8,
              ),
            ],
            buildSummaryTile('Subtotal', (orderSummary.subtotalPrice).currency),
            const CustomSizedBox(
              height: 8,
            ),
            CustomCrossFadeWidget(
                isShownWidget: orderSummary.discountAmount > 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildSummaryTile(
                        'Discount',
                        (-1 * orderSummary.discountAmount).currency,
                        AppStyle.textTheme.bodySmall!
                            .copyWith(color: const Color(0xFF03BF87)),
                        AppStyle.textTheme.bodySmall!
                            .copyWith(color: const Color(0xFF03BF87))),
                    const CustomSizedBox(
                      height: 8,
                    ),
                  ],
                )),
            CustomCrossFadeWidget(
                isShownWidget: orderSummary.couponAmount > 0,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    buildSummaryTile(
                        'Coupon discount',
                        (-1 * orderSummary.couponAmount).currency,
                        AppStyle.textTheme.bodySmall!
                            .copyWith(color: AppStyle.confirmationColor),
                        AppStyle.textTheme.bodySmall!
                            .copyWith(color: AppStyle.confirmationColor)),
                    const CustomSizedBox(
                      height: 8,
                    ),
                  ],
                )),
            buildSummaryTile(
                'Delivery Fee',
                orderSummary.deliveryFee == 0
                    ? 'Free'.translateWord
                    : orderSummary.deliveryFee.currency),
            const CustomSizedBox(
              height: 8,
            ),
            buildSummaryTile(
                'Platform Fee',
                orderSummary.platformFee == 0
                    ? 'Free'.translateWord
                    : orderSummary.platformFee.currency),
            const CustomSizedBox(
              height: 8,
            ),
            Divider(
              color: AppStyle.black.shade200,
            ),
            buildSummaryTile(
              'Total price',
              orderSummary.totalPrice.currency,
              null,
              AppStyle.textTheme.bodyMedium!.copyWith(
                color: AppStyle.darkPrimaryColor,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildSummaryTile(final String title, final String cost,
      [final TextStyle? keyTextStyle, final TextStyle? valueTextStyle]) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Text(title.translateWord,
                style: keyTextStyle ??
                    AppStyle.textTheme.bodySmall!
                        .copyWith(color: AppStyle.black.shade600),
                overflow: TextOverflow.ellipsis)),
        CustomAnimatedText(cost,
            style: valueTextStyle ??
                AppStyle.textTheme.bodySmall!
                    .copyWith(color: AppStyle.black.shade600)),
      ],
    );
  }
}
