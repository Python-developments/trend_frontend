import 'package:flutter/material.dart';
import 'package:trend/core/presentation/dialogs/custom_alert_dialog.dart';
import 'package:trend/core/presentation/router/auto_router.dart';

class ConfirmationDialog extends StatelessWidget {
  final String mainActionText;
  final String? title, content;
  final void Function()? onMainActionPressed;
  final bool isAlertDialog;
  const ConfirmationDialog({
    required this.content,
    required this.mainActionText,
    this.onMainActionPressed,
    super.key,
    this.isAlertDialog = true,
    this.title,
  });

  @override
  Widget build(final BuildContext context) {
    return CustomAlertDialog(
      title: title ?? 'Are you sure?',
      mainActionText: mainActionText,
      content: content,
      secondaryButton: (
        'Cancel',
        () => getAppRouter.maybePop(false),
        isAlertDialog
      ),
      onMainActionPressed: () {
        if (onMainActionPressed != null) {
          onMainActionPressed!();
        } else {
          getAppRouter.maybePop(true);
        }
      },
    );
  }
}
