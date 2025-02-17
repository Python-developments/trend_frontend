import 'package:flutter/material.dart';
import 'package:trend/core/controllers/object_data_loader.dart';
import 'package:trend/core/presentation/widgets/base_data_loader.dart';

class ObjectDataLoaderWidget<T> extends StatelessWidget {
  final ObjectDataLoader<T> dataLoader;
  final Widget Function(T) childBuilder;
  final Widget? nullableChildBuilder;
  final Widget? loadingWidget;
  final Duration? animatingDuration;

  const ObjectDataLoaderWidget({
    required this.dataLoader,
    required this.childBuilder,
    this.animatingDuration,
    super.key,
    this.loadingWidget,
    this.nullableChildBuilder,
  });

  @override
  Widget build(final BuildContext context) {
    return BaseDataLoader<T>(
        dataLoader: dataLoader,
        childBuilder: childBuilder,
        nullableChildBuilder: nullableChildBuilder,
        loadingWidget: loadingWidget,
        animatingDuration: animatingDuration,
        dataGetter: () => dataLoader.data);
  }
}
