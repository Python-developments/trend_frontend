import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/core/presentation/app_style.dart';

class AnimatedQuantityWidget extends StatefulWidget {
  final ValueNotifier<int> quantityNotifier;
  final double size;

  const AnimatedQuantityWidget({
    required this.quantityNotifier,
    required this.size,
    super.key,
  });

  @override
  State<AnimatedQuantityWidget> createState() => _AnimatedQuantityWidgetState();
}

class _AnimatedQuantityWidgetState extends State<AnimatedQuantityWidget>
    with TickerProviderStateMixin {
  late AnimationController incrementAnimationController,
      decrementAnimationController,
      opacityAnimationController;
  late Animation<Offset> incrementAnimation, decrementAnimation;
  late Animation<double> incrementOpacityAnimation, decrementOpacityAnimation;
  late int currentQuantity;

  @override
  void initState() {
    incrementAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..forward(from: 1);
    decrementAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..forward(from: 1);
    opacityAnimationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    )..forward(from: 1);

    incrementOpacityAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(incrementAnimationController);
    decrementOpacityAnimation = Tween<double>(
      begin: 1,
      end: 0,
    ).animate(decrementAnimationController);
    incrementAnimation = Tween<Offset>(begin: Offset.zero, end: const Offset(0, -1))
        .animate(incrementAnimationController);
    decrementAnimation = Tween<Offset>(begin: Offset.zero, end: const Offset(0, 1))
        .animate(decrementAnimationController);

    currentQuantity = widget.quantityNotifier.value;

    widget.quantityNotifier.addListener(() {
      if (widget.quantityNotifier.value > currentQuantity) {
        incrementAnimationController.reset();
        incrementAnimationController.forward();
        opacityAnimationController.forward();
      } else if (widget.quantityNotifier.value < currentQuantity) {
        decrementAnimationController.reset();
        decrementAnimationController.forward();
        opacityAnimationController.forward();
      }
      currentQuantity = widget.quantityNotifier.value;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(final BuildContext context) {
    return Stack(
      children: [
        AnimatedBuilder(
            animation: incrementOpacityAnimation,
            builder: (final _, final  __) => Opacity(
                  opacity: incrementOpacityAnimation.value,
                  child: SlideTransition(
                      position: incrementAnimation,
                      child: SizedBox(
                        height: widget.size.r,
                        width: widget.size.r,
                        child: Center(
                          child: Text(
                            '${currentQuantity - 1}',
                            style: AppStyle.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppStyle.black.shade600),
                          ),
                        ),
                      )),
                )),
        SizedBox(
          height: widget.size.r,
          width: widget.size.r,
          child: Center(
            child: Text(
              '$currentQuantity',
              style: AppStyle.textTheme.bodyLarge!.copyWith(
                  fontWeight: FontWeight.bold, color: AppStyle.black.shade600),
            ),
          ),
        ),
        AnimatedBuilder(
            animation: decrementOpacityAnimation,
            builder: (final _, final __) => Opacity(
                  opacity: decrementOpacityAnimation.value,
                  child: SlideTransition(
                      position: decrementAnimation,
                      child: SizedBox(
                        height: widget.size.r,
                        width: widget.size.r,
                        child: Center(
                          child: Text(
                            '${currentQuantity + 1}',
                            style: AppStyle.textTheme.bodyLarge!.copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppStyle.black.shade600),
                          ),
                        ),
                      )),
                )),
      ],
    );
  }
}
