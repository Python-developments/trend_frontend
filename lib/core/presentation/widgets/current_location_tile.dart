import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/widgets/custom_svg_image.dart';
import 'package:trend/core/controllers/current_location_controller.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/arguments/map_location_viewer_page_arguments.dart';
import 'package:trend/core/presentation/assets.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';
import 'package:trend/core/utils/extensions.dart';
import 'package:trend/core/utils/mixins.dart';

class CurrentLocationTile extends StatelessWidget
    with WidgetControllerCreatorMixin<CurrentLocationController> {
  CurrentLocationTile({super.key});

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onTap: () => getAppRouter.push(MapLocationViewerRoute(
          args: MapLocationViewerPageArguments(
              location: createdController.userApplicationSurfingLocation.$1,
              pageTitle: 'Delivery location'))),
      child: Container(
        padding: EdgeInsets.all(8.r),
        decoration: BoxDecoration(
          color: AppStyle.black.shade100,
          borderRadius: AppStyle.borderRadius,
        ),
        child: Row(
          children: [
            CustomSvgImage(
                path: Assets.location, color: AppStyle.black.shade500),
            const CustomSizedBox(
              width: 8,
            ),
            Expanded(
                child: Text(
              createdController.addressString ?? '',
              overflow: TextOverflow.ellipsis,
              style: AppStyle.textTheme.bodyMedium!
                  .copyWith(color: AppStyle.black.shade900),
            )),
            const CustomSizedBox(
              width: 8,
            ),
            Text(
              'View'.translateWord,
              style: AppStyle.textTheme.bodyMedium!.copyWith(
                  color: Colors.blue,
                  decorationColor: Colors.blue,
                  decoration: TextDecoration.underline),
            )
          ],
        ),
      ),
    );
  }
}
