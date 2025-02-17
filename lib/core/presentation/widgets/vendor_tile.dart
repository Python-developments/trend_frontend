import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/widgets/custom_svg_image.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/arguments/vendor_products_page_arguments.dart';
import 'package:trend/core/presentation/assets.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/core/presentation/widgets/custom_network_image.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/core/utils/extensions.dart';
import 'package:trend/data/local_database/databases/abstract/i_app_local_database.dart';
import 'package:trend/data/local_database/entities/vendor_entity.dart';
import 'package:trend/data/models/vendors/vendor_model.dart';
import 'package:trend/dependencies.dart';

class VendorTile extends StatelessWidget {
  final VendorModel vendor;
  final bool isSearchPage;

  const VendorTile(
      {required this.vendor, required this.isSearchPage, super.key});

  @override
  Widget build(final BuildContext context) {
    final double imageHeight =
        context.deviceType == ClientDeviceType.phone ? 154.h : 184.h;
    return GestureDetector(
        onTap: () {
          if (isSearchPage) {
            getIt<IAppLocalDatabase>().insertSearchVendor(VendorEntity(
                id: vendor.id,
                name: vendor.name,
                orderEstimationTime: vendor.orderEstimationTime,
                coverUrl: vendor.coverUrl,
                rate: vendor.rate,
                reviewsCount: vendor.reviewsCount,
                minimumOrderAmount: vendor.minimumOrderAmount.toDouble()));
          }
          getAppRouter.push(VendorProductsRoute(
              args: VendorDetailsPageArguments(
            vendorId: vendor.id,
          )));
        },
        child: Column(
          children: [
            DecoratedBox(
              //width: width,
              decoration: const BoxDecoration(
                borderRadius: AppStyle.borderRadius,
              ),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Stack(
                      children: [
                        CustomNetworkImage(
                          imagePath: vendor.coverUrl,
                          boxFit: BoxFit.cover,
                          height: imageHeight,
                          width: double.infinity,
                          radius: AppStyle.borderRadius,
                        ),
                        Container(
                            height: imageHeight,
                            //width: width,
                            decoration: const BoxDecoration(
                              borderRadius: AppStyle.borderRadius,
                              gradient: LinearGradient(
                                colors: [Colors.transparent, Colors.black54],
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                              ),
                            )),
                        Container(
                          height: imageHeight,
                          //width: width,
                          padding: EdgeInsets.symmetric(horizontal: 8.w),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              const Spacer(),
                              Directionality(
                                textDirection: TextDirection.ltr,
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    /*SvgPicture.network(vendor.logoUrl??''),*/
                                    CachedNetworkImage(
                                        height: 60.r,
                                        width: 100.r,
                                        imageUrl: vendor.logoUrl ?? '',
                                        errorWidget:
                                            (final _, final __, final ___) =>
                                                Container(),
                                        placeholder: (
                                          final _,
                                          final __,
                                        ) =>
                                            Container()),
                                    const Spacer(),
                                    Column(
                                      children: [
                                        Container(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 4.w, vertical: 2.h),
                                          decoration: const BoxDecoration(
                                            color: AppStyle.white,
                                            borderRadius: AppStyle.borderRadius,
                                          ),
                                          child: Row(
                                            children: [
                                              const CustomSvgImage(
                                                path: Assets.clockEmpty,
                                                size: 16,
                                              ),
                                              const CustomSizedBox(
                                                width: 4,
                                              ),
                                              Text(
                                                vendor.orderEstimationTime,
                                                style: AppStyle
                                                    .textTheme.bodySmall,
                                              ),
                                            ],
                                          ),
                                        ),
                                        const CustomSizedBox(
                                          height: 8,
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                        if (vendor.vendorStatus != VendorStatus.OPEN)
                          Container(
                            height: imageHeight,
                            //    width:  width,
                            decoration: const BoxDecoration(
                              borderRadius: AppStyle.borderRadius,
                              color: Colors.black38,
                            ),
                            child: Center(
                              child: Text(
                                (vendor.vendorStatus == VendorStatus.CLOSED
                                        ? 'Closed'
                                        : 'Busy')
                                    .translateWord,
                                style: AppStyle.textTheme.bodyLarge!.copyWith(
                                  color: AppStyle.white,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                    Container(
                        padding: EdgeInsets.symmetric(
                            horizontal: 12.w, vertical: 4.h),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                children: [
                                  Expanded(
                                    child: RichText(
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        text: TextSpan(
                                            text: vendor.name.split('-')[0],
                                            style: AppStyle.textTheme.bodySmall!
                                                .copyWith(
                                                    fontWeight:
                                                        FontWeight.bold),
                                            children: [
                                              TextSpan(
                                                text: vendor.name
                                                            .split('-')
                                                            .length ==
                                                        2
                                                    ? vendor.name.split('-')[1]
                                                    : '',
                                                style: AppStyle
                                                    .textTheme.labelSmall!
                                                    .copyWith(
                                                        color: AppStyle
                                                            .black.shade600,
                                                        fontWeight:
                                                            FontWeight.normal),
                                              )
                                            ])),
                                  ),
                                  const CustomSizedBox(
                                    width: 8,
                                  ),
                                  if (vendor.reviewsCount > 0)
                                    GestureDetector(
                                      onTap: () => getAppRouter.push(
                                          VendorDetailsRoute(
                                              args: VendorDetailsPageArguments(
                                                  vendorId: vendor.id))),
                                      child: Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          const Icon(
                                            Icons.star,
                                            color: AppStyle.starsColor,
                                          ),
                                          const CustomSizedBox(
                                            width: 4,
                                          ),
                                          Text(
                                              '${vendor.rate} (${vendor.reviewsCount} ${'Reviews'.translateWord})',
                                              style: AppStyle
                                                  .textTheme.labelSmall!
                                                  .copyWith()),
                                        ],
                                      ),
                                    ),
                                ],
                              ),
                              const CustomSizedBox(
                                height: 2,
                              ),
                              Text(
                                  '${'Minimum order AED'.translateWord} ${vendor.minimumOrderAmount}',
                                  style: AppStyle.textTheme.labelSmall!
                                      .copyWith(color: AppStyle.black.shade600))
                            ])),
                  ]),
            ),
            const CustomSizedBox(
              height: 4,
            ),
          ],
        ));
  }
}
