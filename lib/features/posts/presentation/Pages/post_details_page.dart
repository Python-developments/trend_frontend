import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend/features/posts/presentation/Manager/post_details_bloc/post_details_bloc.dart';
import 'package:trend/features/posts/presentation/Manager/post_details_bloc/post_details_event.dart';
import 'package:trend/features/posts/presentation/Manager/post_details_bloc/post_details_state.dart';
import 'package:trend/features/posts/presentation/widgets/post_details_content.dart';
import 'package:trend/shared/style/app_styles.dart';

class PostDetailsPage extends StatelessWidget {
  final int postId;

  const PostDetailsPage({Key? key, required this.postId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: BlocBuilder<PostDetailsBloc, PostDetailsState>(
        bloc:BlocProvider.of<PostDetailsBloc>(context)..add(FetchPostDetails(postId)),
        builder: (context, state) {
          if (state is PostDetailsLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is PostDetailsLoaded) {
            return PostDetailsContent(postDetails: state.postDetails);
          } else if (state is PostDetailsError) {
            return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
          }
          return Container();
        },
      ),
    );
  }
}
