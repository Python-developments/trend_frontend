import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/controllers/list_data_loader.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';
import 'package:trend/core/presentation/widgets/object_data_loader_widget.dart';

import 'package:trend/core/presentation/widgets/custom_animated_list.dart';

class CustomAnimatedListDataLoaderWidget<T> extends StatelessWidget {
  final ListDataLoader<T> dataLoader;
  final Widget Function(T) dataToWidgetMapper;
  final double spacing, endingSpace;
  final Widget? loadingWidget;
  final EdgeInsets? padding;


  const CustomAnimatedListDataLoaderWidget({
    required this.dataLoader,
    required this.dataToWidgetMapper, this.spacing = 8,
    this.endingSpace = 0,
    this.loadingWidget,
    this.padding,
    super.key,
  }) ;

  @override
  Widget build(final BuildContext context) {
    return ObjectDataLoaderWidget(
        key: ValueKey(dataLoader.data?.length),
        dataLoader: dataLoader,
        loadingWidget: loadingWidget !=null? Padding(
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
                    )):null,
        childBuilder: (final data) =>
            RefreshIndicator(
                onRefresh: dataLoader.loadData,
                child: CustomAnimatedList(
                  listKey: dataLoader.animatedListKey,
                  spacerHeight: spacing,
                  padding: padding,
                  children:dataLoader.data!.map(dataToWidgetMapper).toList(),
                )));
  }
}
