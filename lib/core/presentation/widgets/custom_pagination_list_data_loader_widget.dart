import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/controllers/pagination_list_data_loader.dart';
import 'package:trend/core/presentation/widgets/object_data_loader_widget.dart';
import 'package:trend/core/presentation/widgets/three_dots_loading_indicator.dart';

class CustomPaginationListDataLoaderWidget<T> extends StatefulWidget {
  final PaginationListDataLoader<T> dataLoader;
  final EdgeInsets? padding;
  final Widget Function(List<T>)? dataToWidgetMapper;
  final Widget Function(List<T>,ScrollController)? scrolledDataToWidgetMapper;

  final ScrollController? scrollController;
  final Widget? loadingWidget;

  const CustomPaginationListDataLoaderWidget(
      {required this.dataLoader,
      this.dataToWidgetMapper,
      this.scrolledDataToWidgetMapper,
      this.padding,
      this.loadingWidget,
      super.key,
      this.scrollController})
      : assert(!(scrolledDataToWidgetMapper == null &&
            dataToWidgetMapper == null));

  @override
  State<CustomPaginationListDataLoaderWidget<T>> createState() =>
      _CustomPaginationListDataLoaderWidgetState<T>();
}

class _CustomPaginationListDataLoaderWidgetState<T>
    extends State<CustomPaginationListDataLoaderWidget<T>> {
  late ScrollController scrollController;

  @override
  void initState() {
    scrollController = (widget.scrollController ?? ScrollController())
      ..addListener(() async {
        if (widget.dataLoader.canLoadMoreData &&
            !widget.dataLoader.isLoadingMoreData &&
            scrollController.position.pixels ==
                scrollController.position.maxScrollExtent) {
          await widget.dataLoader.loadNextPage();
        }
      });
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return RefreshIndicator(
        onRefresh: widget.dataLoader.loadData,
        child: AnimatedSwitcher(
          duration: const Duration(milliseconds: 300),
          transitionBuilder: (final child, final animation) => ScaleTransition(
            scale: animation,
            child: child,
          ),
          child: ObjectDataLoaderWidget(
              dataLoader: widget.dataLoader,
              loadingWidget: widget.loadingWidget,
              childBuilder: (final data) => Column(
                    children: [
                      widget.scrolledDataToWidgetMapper != null
                          ? Expanded(
                            child: widget.scrolledDataToWidgetMapper!(
                                data, scrollController),
                          )
                          : Expanded(
                              child: SingleChildScrollView(
                              physics: const AlwaysScrollableScrollPhysics(),
                              padding: widget.padding ??
                                  EdgeInsets.symmetric(
                                      vertical: 16.h, horizontal: 8.w),
                              controller: scrollController,
                              child: widget.dataToWidgetMapper!(data),
                            )),
                      if (widget.dataLoader.isLoadingMoreData)
                        const ThreeDotsLoadingIndicator(),
                    ],
                  )),
        ));
  }

  @override
  void dispose() {
    if (widget.scrollController == null) {
      scrollController.dispose();
    }
    super.dispose();
  }
}
