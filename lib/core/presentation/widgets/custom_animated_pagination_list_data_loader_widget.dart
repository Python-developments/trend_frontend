import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/controllers/pagination_list_data_loader.dart';
import 'package:trend/core/presentation/widgets/custom_animated_list.dart';
import 'package:trend/core/presentation/widgets/custom_empty_view.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';
import 'package:trend/core/presentation/widgets/three_dots_loading_indicator.dart';

class CustomAnimatedPaginationListDataLoaderWidget<T> extends StatefulWidget {
  final PaginationListDataLoader<T> dataLoader;
  final Widget Function(T) dataToWidgetMapper;
  final ScrollController? scrollController;
  final double spacerHeight;
  final Widget? loadingWidget;
  final int? loadingWidgetChildrenCount;
  final EdgeInsets? padding;

  const CustomAnimatedPaginationListDataLoaderWidget({
    required this.dataLoader,
    required this.dataToWidgetMapper,
    this.loadingWidget,
    this.loadingWidgetChildrenCount,
    this.spacerHeight = 12,
    super.key,
    this.padding,
    this.scrollController,
  });

  @override
  State<CustomAnimatedPaginationListDataLoaderWidget<T>> createState() =>
      _CustomAnimatedPaginationListDataLoaderWidgetState<T>();
}

class _CustomAnimatedPaginationListDataLoaderWidgetState<T>
    extends State<CustomAnimatedPaginationListDataLoaderWidget<T>> {
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
          duration: const Duration(milliseconds: 1000),
          transitionBuilder: (final child, final animation) => ScaleTransition(
            scale: animation,
            child: child,
          ),
          child: Observer(builder: (final _) {
            widget.dataLoader.isLoading;

            return widget.dataLoader.isLoading
                ? widget.loadingWidget != null
                    ? SingleChildScrollView(
                        padding: widget.padding ??
                            EdgeInsets.symmetric(horizontal: 8.w),
                        child: Column(children: [
                          for (int i = 0;
                              i < widget.loadingWidgetChildrenCount!;
                              i++) ...[
                            CustomSizedBox(
                              height: widget.spacerHeight,
                            ),
                            widget.loadingWidget!,
                          ]
                        ]),
                      )
                    : const Center(child: CircularProgressIndicator())
                : widget.dataLoader.error != null
                    ? CustomEmptyView(controller: widget.dataLoader)
                    : Column(
                        children: [
                          Expanded(
                            child: CustomAnimatedList(
                              listKey: widget.dataLoader.animatedListKey,
                              spacerHeight: widget.spacerHeight,
                              scrollController: scrollController,
                              padding: widget.padding,
                              children: [
                                ...widget.dataLoader.data!
                                    .map(widget.dataToWidgetMapper)
                              ],
                            ),
                          ),
                          if (widget.dataLoader.isLoadingMoreData)
                            const ThreeDotsLoadingIndicator(),
                        ],
                      );
          }),
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
