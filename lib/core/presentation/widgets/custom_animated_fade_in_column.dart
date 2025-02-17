import 'package:flutter/material.dart';
import 'package:trend/core/presentation/widgets/custom_sized_box.dart';

class CustomAnimatedFadeInColumn extends StatefulWidget {
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;
  final List<Widget>children;


  const CustomAnimatedFadeInColumn({required this.children, this.mainAxisAlignment = MainAxisAlignment.start,
  this.mainAxisSize = MainAxisSize.max,
  this.crossAxisAlignment = CrossAxisAlignment.center,super.key});

  @override
  CustomAnimatedFadeInColumnState createState() => CustomAnimatedFadeInColumnState();
}

class CustomAnimatedFadeInColumnState extends State<CustomAnimatedFadeInColumn> with TickerProviderStateMixin{
  final List<AnimationController> controllers = [];

  @override
  void initState() {
    super.initState();
    for (int i = 0,animatedChild=0; i < widget.children.length; i++) {
      controllers.add(AnimationController(vsync: this, duration: Duration(milliseconds: (_canAnimate(widget.children[i])) ? 400 + ((animatedChild++) * 50) : 0)));
      controllers[i]
        ..addListener(() => setState(() {})) // Rebuild on animation updates
        ..forward();
    }
  }

  bool _canAnimate(final Widget child)=>child is! CustomSizedBox && child is! Spacer;

  @override
  Widget build(final BuildContext context) {
    return Column(
        crossAxisAlignment: widget.crossAxisAlignment,
        mainAxisAlignment: widget.mainAxisAlignment,

        mainAxisSize: widget.mainAxisSize,

        children: [
        for (int i = 0; i < widget.children.length; i++)
          !_canAnimate(widget.children[i])?widget.children[i] :
    AnimatedBuilder(
      animation: controllers[i],
      child: widget.children[i],
      builder: (final context, final child) =>SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0, -0.15),
          end: Offset.zero,
        ).animate(controllers[i]),
        child: FadeTransition(
          opacity: Tween<double>(begin: 0.0, end: 1.0).animate(controllers[i]),
          child: widget.children[i],
        ),
      ),
    ),
    ],
    );
  }

  @override
  void dispose() {
    for (final controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
