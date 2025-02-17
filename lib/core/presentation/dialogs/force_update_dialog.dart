import 'package:flutter/material.dart';
import 'package:trend/core/presentation/dialogs/custom_alert_dialog.dart';
import 'package:trend/core/utils/mixins.dart';
import 'package:trend/third_parties_modules/abstract/i_native_device_store_module.dart';

class ForceUpdateDialog extends StatelessWidget
    with WidgetModuleCreatorMixin<INativeDeviceStoreModule> {
  ForceUpdateDialog({super.key});

  @override
  Widget build(final BuildContext context) {
    return CustomAlertDialog(
      title: 'Application update!',
      content:
          'This version is not supported anymore , please update to the last version',
      mainActionText: 'Update',
      isDismissible: false,
      onMainActionPressed: createdModule.redirectToStore,
    );
  }
}
