import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ExploreExplorePostContainer extends StatelessWidget {
  const ExploreExplorePostContainer({super.key, });


  @override
  Widget build(final BuildContext context) {
    return AspectRatio(
      aspectRatio: 4 / 5, // Keeps consistent image ratio
      child: CachedNetworkImage(
        imageUrl:'', // Request high-quality image
        fit: BoxFit.fill, // Prevents stretching
        errorWidget: (final context, final url, final error) => const Icon(Icons.error, size: 40),
      ),
    );
  }
}
