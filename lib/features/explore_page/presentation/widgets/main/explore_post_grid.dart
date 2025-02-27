import 'dart:async';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:trend/features/explore_page/bloc/explore_bloc.dart';
import 'package:trend/features/posts/data/models/post_model.dart';

class ExplorePostGrid extends StatefulWidget {
  const ExplorePostGrid({Key? key}) : super(key: key);

  @override
  _ExplorePostGridState createState() => _ExplorePostGridState();
}

class _ExplorePostGridState extends State<ExplorePostGrid> {
  final ScrollController _scrollController = ScrollController();
  late StreamSubscription<ExploreState> _exploreStateSubscription;
  bool isFirstDependencies=true;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(!isFirstDependencies)
      return ;
    isFirstDependencies=false;
    BlocProvider.of<ExploreBloc>(context).pagingController.addPageRequestListener((pageKey) {
      BlocProvider.of<ExploreBloc>(context).add(FetchPostsByPage(page: (pageKey ~/ BlocProvider.of<ExploreBloc>(context).pageSize) + 1));
    });
  }

  @override
  void dispose() {
    _scrollController.dispose();
    _exploreStateSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      color: Colors.white,
      backgroundColor: Colors.grey,
      onRefresh: () => Future.sync(() {
        BlocProvider.of<ExploreBloc>(context).add(RefreshPosts());
      }),
      child: PagedGridView<int, PostModel>(
        showNewPageProgressIndicatorAsGridChild: false,
        showNewPageErrorIndicatorAsGridChild: false,
        showNoMoreItemsIndicatorAsGridChild: false,
        pagingController: BlocProvider.of<ExploreBloc>(context).pagingController,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          mainAxisSpacing: 2,
          crossAxisSpacing: 2,
          crossAxisCount: 3,
        ),
        builderDelegate: PagedChildBuilderDelegate<PostModel>(
          itemBuilder: (context, item, index) {
            final post = item;
            return SizedBox(
              width: double.infinity,
              height: 200,
              child: CachedNetworkImage(
                imageUrl: post.image ??
                    "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9nJ_3Dmrsxec-D2q43IRnN7ntGIRa4qO8qXONXdxzdX053t3OUSivYJoBr-uSTpOVEcY&usqp=CAU", // Request high-quality image
                fit: BoxFit.fill, // Prevents stretching
                errorWidget: (context, url, error) => const Icon(Icons.error, size: 40),
              ),
            );
          },
        ),
      ),
    );
    // return RefreshIndicator(
    //   color: Colors.white,
    //   backgroundColor: Colors.grey,
    //   onRefresh: () => Future.sync(() {}),
    //   child: GridView.builder(
    //     gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
    //       crossAxisCount: 3,
    //       mainAxisSpacing: 2,
    //       crossAxisSpacing: 2,
    //     ),
    //     itemCount: state.allPost.results.length,
    //     itemBuilder: (context, index) {
    //       final post = state.allPost.results[index];
    //       return SizedBox(
    //         width: double.infinity,
    //         height: 200,
    //         child: CachedNetworkImage(
    //           imageUrl: post.image ??
    //               "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9nJ_3Dmrsxec-D2q43IRnN7ntGIRa4qO8qXONXdxzdX053t3OUSivYJoBr-uSTpOVEcY&usqp=CAU", // Request high-quality image
    //           fit: BoxFit.fill, // Prevents stretching
    //           errorWidget: (context, url, error) => const Icon(Icons.error, size: 40),
    //         ),
    //       );
    //     },
    //   ),
    // );
  }
}
