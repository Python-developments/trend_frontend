import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/widgets/custom_svg_image.dart';
import 'package:trend/core/controllers/current_location_controller.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/assets.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';
import 'package:trend/core/utils/extensions.dart';
import 'package:trend/core/utils/mixins.dart';

class CurrentLocationHeader extends StatelessWidget
    with WidgetControllerCreatorMixin<CurrentLocationController> {
  final bool canPress;
  CurrentLocationHeader({required this.canPress, super.key});

  @override
  Widget build(final BuildContext context) {
    return Observer(
        builder: (final _) => GestureDetector(
            onTap: canPress
                ? () => getAppRouter.push(AddressSelectionRoute())
                : () {},
            child: SizedBox(
              width: 220.w,
              child: Row(
                children: [
                  const CustomSvgImage(
                    path: Assets.location,
                    color: AppStyle.white,
                  ),
                  const CustomSizedBox(
                    width: 8,
                  ),
                  Expanded(
                    child: Text(
                      '${'Delivering to'.translateWord} : ${createdController.addressString ?? ''}',
                      maxLines: 2,
                      style: AppStyle.textTheme.labelSmall!.copyWith(
                          color: const Color(0xFF92FF90),
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            )));
  }
}
