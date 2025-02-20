import 'package:flutter/material.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/widgets/custom_animated_list_data_loader_widget.dart';
import 'package:trend/dependencies.dart';
import 'package:trend/features/posts/controllers/posts_controller.dart';

import 'package:trend/features/posts/presentation/Manager/Bloc_post/post_bloc.dart';
import 'package:trend/features/posts/presentation/Manager/Bloc_post/post_event.dart';
import 'package:trend/features/posts/presentation/Manager/Bloc_post/post_state.dart';
import 'package:trend/features/posts/presentation/Pages/main_post.dart';
import 'package:trend/features/posts/presentation/widgets/Post_Shimmer.dart';



class PostsPage extends StatelessWidget {
  const PostsPage({super.key});


  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: AppStyle.white,
        scrolledUnderElevation: 0,
        elevation: 0,
        title: const Align(
          alignment: Alignment.centerLeft,
          child: Text(
            'T  R  E  N  D',
            style: TextStyle(
              color: Colors.black,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
      body: CustomAnimatedListDataLoaderWidget(
          dataLoader: getIt<PostsController>(),
          dataToWidgetMapper: (final post)=> MainPost(
                  post: post
        ),
      ),
    );
  }
}
