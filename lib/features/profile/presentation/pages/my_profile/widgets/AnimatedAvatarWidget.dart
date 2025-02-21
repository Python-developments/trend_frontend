import 'package:flutter/material.dart';
import 'package:trend/features/posts/presentation/widgets/Networkimage.dart';
import 'package:trend/shared/const/app_links.dart';

class AnimatedAvatarWidget extends StatelessWidget {
  final String avatarUrl;

  const AnimatedAvatarWidget({
     required this.avatarUrl, super.key,
  });

  @override
  Widget build(final BuildContext context) {
    return Positioned.fill(
      child: Padding(
        padding: EdgeInsets.only(top: MediaQuery.of(context).padding.top),
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          child: Column(
            children: [
              Expanded(child: Container()),
              TweenAnimationBuilder<double>(
                tween: Tween<double>(begin: 0.0, end: 100),
                duration: Duration(milliseconds: 70),
                builder: (final context, final size, final child) {
                  return Networkimages(
                    imageUrl: avatarUrl.startsWith('http') ? avatarUrl : '${ApiEndpoints.baseUrl}$avatarUrl',
                    size: size,
                  );
                },
              ),
              Expanded(child: Container()),
            ],
          ),
        ),
      ),
    );
  }
}
