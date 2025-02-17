import 'package:flutter/material.dart';

class CustomCrossFadeWidget extends StatelessWidget {
  final bool isShownWidget;
  final Widget child;
  const CustomCrossFadeWidget(
      {required this.isShownWidget, required this.child, super.key});

  @override
  Widget build(final BuildContext context) {
    return AnimatedCrossFade(
        firstChild: child,
        secondChild: Container(),
        crossFadeState: isShownWidget
            ? CrossFadeState.showFirst
            : CrossFadeState.showSecond,
        duration: const Duration(milliseconds: 300));
  }
}
