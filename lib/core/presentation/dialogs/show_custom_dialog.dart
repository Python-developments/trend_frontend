import 'package:flutter/material.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/core/utils/extensions.dart';

Future<T?> showCustomDialog<T>(
        {required final Widget dialog, final bool isDismissible = true}) =>
    showAdaptiveDialog<T?>(
      context: getAppRouter.currentContext,
      barrierDismissible: isDismissible,
      builder: (final dialogCtx) => PopScope(
          canPop: isDismissible,
          child: dialog
      ),
    );
