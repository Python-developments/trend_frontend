import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:trend/core/controllers/app_controller.dart';
import 'package:trend/core/presentation/widgets/custom_empty_view.dart';
import 'package:trend/core/utils/mixins.dart';

@RoutePage()
class AppErrorPage extends StatelessWidget
    with WidgetControllerCreatorMixin<AppController> {
  AppErrorPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
        body: CustomEmptyView(
      controller: createdController,
    ));
  }
}
