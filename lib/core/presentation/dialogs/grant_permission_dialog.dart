import 'package:flutter/material.dart';
import 'package:trend/core/presentation/assets.dart';
import 'package:trend/core/presentation/dialogs/custom_image_dialog.dart';
import 'package:trend/core/utils/extensions.dart';
import 'package:trend/core/utils/mixins.dart';
import 'package:trend/third_parties_modules/abstract/i_permissions_handler_module.dart';

class GrantPermissionDialog extends StatelessWidget with WidgetModuleCreatorMixin<IPermissionsHandlerModule>{
  final String permissionName;
   GrantPermissionDialog({required this.permissionName, super.key});

  @override
  Widget build(final BuildContext context) {

    return CustomImageDialog(
        imagePath: Assets.permissions,
        mainActionTitle: 'Go to settings',
        content: 'Permission required',
        subtitle: 'Please enable [0] permissions to continue'.translateWordWithArguments(arguments: [(permissionName.translateWord)]),
        onMainActionPressed: createdModule.openAppSettings,
        imageSize: 122,
    );
  }
}
