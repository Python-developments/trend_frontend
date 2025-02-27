import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AnimatedAvatarWidget extends StatelessWidget {
  final bool isVisible;
  final String avatarUrl;

  const AnimatedAvatarWidget({
    Key? key,
    required this.isVisible,
    required this.avatarUrl,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Positioned.fill(
        child: Padding(
          padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Column(
              children: [
                Expanded(child: Container()),
                TweenAnimationBuilder<double>(
                  tween: Tween<double>(begin: 0.0, end: 100),
                  duration: Duration(milliseconds: 70),
                  builder: (context, size, child) {
                    return ClipOval(
                      child: CachedNetworkImage(
                        imageUrl: avatarUrl,
                        errorWidget: (_, __, ___) => Image.asset('assets/images/avatar.jpg'),
                        placeholder: (
                          _,
                          __,
                        ) =>
                            Image.asset('assets/images/avatar.jpg'),
                        fit: BoxFit.cover,
                        height: 200.r,
                        width: 200.r,
                      ),
                    );
                  },
                ),
                Expanded(child: Container()),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
