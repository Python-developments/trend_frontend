import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/data/models/posts/post_model.dart';
import 'package:trend/features/posts/presentation/widgets/ZoomingImage.dart';
import 'package:trend/shared/const/app_links.dart';

class BodyPost extends StatefulWidget {
  final PostModel post;

  const BodyPost({required this.post, super.key});

  @override
  State<BodyPost> createState() => _BodyPostState();
}

class _BodyPostState extends State<BodyPost> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  bool _isAnimating = false;
  double _heartSize = 0.0;

  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );

    _animation = Tween(begin: 1.0, end: 1.5).animate(_controller)
      ..addListener(() {
        setState(() {
          _heartSize = 30.sp * _animation.value;
        });
      })
      ..addStatusListener((final status) {
        if (status == AnimationStatus.completed) {
          _controller.reverse();
        } else if (status == AnimationStatus.dismissed) {
          _isAnimating = false;
        }
      });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  Future<void> _animateHeart() async {
    if (!_isAnimating) {
      _isAnimating = true;
      _controller.forward();
      await Future.delayed(const Duration(milliseconds: 300));
      _controller.reset();
    }
  }

  Future<void> _likeOrUnLikePost(final BuildContext context) async {
   // context.read<PostBloc>().add(LikePost(postId: widget.post.id ?? 0));

    _animateHeart();
    await Future.delayed(const Duration(milliseconds: 300));
    setState(() {
      _heartSize = 0.0;
    });
  }

  @override
  Widget build(final BuildContext context) {
    return GestureDetector(
      onDoubleTap: () {
        _likeOrUnLikePost(context);
      },
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: FittedBox(
              fit: BoxFit.scaleDown,
              child: ConstrainedBox(
                constraints: BoxConstraints(
                  maxHeight: 300, // Set the maximum height
                ),
                child: SizedBox(
                  width: 360.w,
                  child: FittedBox(
                    fit: BoxFit.cover,
                    child: ZoomingImage(
                      image: widget.post.image ?? '${ApiEndpoints.baseUrl}/media/profile_images/default_image.jpg',
                    ),
                  ),
                ),
              ),
            ),
          ),
          _heartSize > 0
              ? Positioned(
                  top: 0,
                  right: 0,
                  left: 0,
                  bottom: 0,
                  child: Icon(
                    Icons.favorite,
                    color: Color(0xffFF0A00),
                    size: _heartSize,
                  ),
                )
              : const SizedBox.shrink(),
        ],
      ),
    );
  }
}
