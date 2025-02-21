import 'package:flutter/material.dart';
import 'package:trend/core/controllers/base_controller.dart';
import 'package:trend/core/presentation/widgets/no_data_view.dart';

class CustomEmptyView extends StatelessWidget {
  final BaseController controller;
  const CustomEmptyView({required this.controller, super.key});

  @override
  Widget build(final BuildContext context) {
    return NoDataView(
      errorMessage: controller.error!.errorMessage,
      errorImage: controller.error!.errorImage,
      helperButton:controller.errorButton!=null?
      (controller.errorButton!.$1,controller.isLoading,controller.errorButton!.$2):null,
    );
  }
}
