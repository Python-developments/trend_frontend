import 'package:flutter/material.dart';
import 'package:trend/data/models/posts/post_model.dart';
import 'package:trend/features/posts/presentation/Pages/activities_post.dart';
import 'package:trend/features/posts/presentation/Pages/body_post.dart';
import 'package:trend/features/posts/presentation/Pages/header_post.dart';

class MainPost extends StatelessWidget {
  final PostModel post;
  const MainPost({required this.post, super.key});

  @override
  Widget build(final BuildContext context) {
    return Column(
      children: [
        HeaderPost(post: post),
        BodyPost(post: post),
        ActivitiesPost(
          post: post,
        ),
      ],
    );
  }
}
