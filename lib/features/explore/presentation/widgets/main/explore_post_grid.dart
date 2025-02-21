import 'package:flutter/material.dart';

import 'package:trend/data/models/posts/post_model.dart';
import 'package:trend/features/explore/presentation/widgets/for_you/explore_explore_post_container.dart';


class ExplorePostGrid extends StatelessWidget {
  final List<PostModel> posts;
  const ExplorePostGrid({required this.posts, super.key});

  @override
  Widget build(final BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: const BouncingScrollPhysics(),
      itemCount: posts.length, // +1 for the loading indicator
      itemBuilder: (final context, final index) {
        return SizedBox(
          height: 200 ,
          child: ExploreExplorePostContainer(image: posts[index].image,),
        );
      },
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 2,
        crossAxisSpacing: 2,
      ),
    );
  }
}
