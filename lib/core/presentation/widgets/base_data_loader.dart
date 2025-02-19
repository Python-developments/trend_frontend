import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:trend/core/controllers/base_controller.dart';
import 'package:trend/core/presentation/widgets/custom_empty_view.dart';

class BaseDataLoader<T> extends StatelessWidget {
  final BaseController dataLoader;
  final Widget Function(T) childBuilder;
  final Widget? nullableChildBuilder;
  final Widget? loadingWidget;
  final T? Function() dataGetter;
  final Duration? animatingDuration;

  const BaseDataLoader(
      {required this.dataLoader,
      required this.childBuilder,
      required this.dataGetter,
      this.animatingDuration,
      this.loadingWidget,
        this.nullableChildBuilder,
      super.key});

  @override
  Widget build(final BuildContext context) {
    return Observer(
        builder: (final _) => AnimatedSwitcher(
            duration: animatingDuration ?? const Duration(milliseconds: 300),
            child: dataLoader.isLoading
                ? (loadingWidget ??
                    const Center(child: CircularProgressIndicator()))
                : dataLoader.error != null
                    ? CustomEmptyView(
                        controller: dataLoader,
                      )
                    : dataGetter() == null
                        ? nullableChildBuilder!=null? nullableChildBuilder!: Container()
                        : childBuilder(
                            dataGetter() as T,
                          )));
  }
}
