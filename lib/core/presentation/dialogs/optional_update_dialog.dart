import 'package:flutter/material.dart';
import 'package:trend/core/presentation/dialogs/custom_alert_dialog.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/core/utils/mixins.dart';
import 'package:trend/third_parties_modules/abstract/i_native_device_store_module.dart';

class OptionalUpdateDialog extends StatelessWidget
    with WidgetModuleCreatorMixin<INativeDeviceStoreModule> {

  OptionalUpdateDialog({super.key});

  @override
  Widget build(final BuildContext context) {
    return CustomAlertDialog(
        title: 'Update available!',
        content: 'Update the application for more offers and discounts',
        mainActionText: 'Update',
        onMainActionPressed: createdModule.redirectToStore,
        secondaryButton: ('Later', getAppRouter.maybePop, true));
  }
}
