import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/controllers/list_data_loader.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';
import 'package:trend/core/presentation/widgets/object_data_loader_widget.dart';

class CustomListDataLoaderWidget<T> extends StatelessWidget {
  final ListDataLoader<T> dataLoader;
  final Widget Function(List<T>) listToWidgetMapper;
  final double spacing, endingSpace;
  final Widget? loadingWidget;

  const CustomListDataLoaderWidget({
    required this.dataLoader,
    required this.listToWidgetMapper,
    this.spacing = 8,
    this.endingSpace = 0,
    this.loadingWidget,
    super.key,

  });

  @override
  Widget build(final BuildContext context) {
    return ObjectDataLoaderWidget(
        key: ValueKey(dataLoader.data?.length),
        dataLoader: dataLoader,
        loadingWidget:
        loadingWidget!=null ? SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 8.w),
          child: Column(
            children: [
              CustomSizedBox(
                height: spacing,
              ),
              loadingWidget!,
              CustomSizedBox(
                height: spacing,
              ),
              loadingWidget!,
              CustomSizedBox(
                height: spacing,
              ),
              loadingWidget!,
              CustomSizedBox(
                height: spacing,
              ),
            ],
          ),
        ):null,
        childBuilder:  listToWidgetMapper);
  }
}
