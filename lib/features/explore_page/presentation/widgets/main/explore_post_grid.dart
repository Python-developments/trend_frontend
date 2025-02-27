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
  final PagingController<int, PostModel> _pagingController = PagingController(firstPageKey: 0, invisibleItemsThreshold: 20);
  late StreamSubscription<ExploreState> _exploreStateSubscription;
  int page = 1;
  int pageSize = 10;
  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      BlocProvider.of<ExploreBloc>(context).add(FetchPostsByPage(page: page));
    });
    _exploreStateSubscription = BlocProvider.of<ExploreBloc>(context).stream.listen((state) {
      if (state is ExploreLoad) {
        final isLastPage = state.posts.length < pageSize;
        if (isLastPage) {
          _pagingController.appendLastPage(state.posts);
        } else {
          final nextPageKey = page * pageSize;
          _pagingController.appendPage(state.posts, nextPageKey);
        }
        page++;
      }
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
        page = 1;
        _pagingController.refresh();
      }),
      child: PagedGridView<int, PostModel>(
        showNewPageProgressIndicatorAsGridChild: false,
        showNewPageErrorIndicatorAsGridChild: false,
        showNoMoreItemsIndicatorAsGridChild: false,
        pagingController: _pagingController,
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
