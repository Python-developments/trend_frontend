import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:trend/features/posts/data/models/post_model.dart';
import 'package:trend/features/posts/presentation/Manager/Bloc_post/post_bloc.dart';
import 'package:trend/features/posts/presentation/Manager/Bloc_post/post_event.dart';
import 'package:trend/features/posts/presentation/Manager/Bloc_post/post_state.dart';
import 'package:trend/features/posts/presentation/Pages/main_post.dart';
import 'package:trend/features/posts/presentation/widgets/Post_Shimmer.dart';
import 'package:trend/shared/core/shared_preferences.dart';

import '../../../../shared/const/app_links.dart';
import '../../../../shared/const/colors.dart';
import '../../../../shared/core/local/SharedPreferencesDemo.dart';
import '../../../notifications/presentation/Manager/NotificationBloc/notification_bloc.dart';
import '../Manager/Bloc_Current_user/Current _user_Bloc.dart';
import '../Manager/Bloc_Current_user/Current _user_event.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PagingController<int, PostModel> _pagingController = PagingController(firstPageKey: 0, invisibleItemsThreshold: 2);

  int pageSize = 10;
  int page = 1;
  @override
  void initState() {
    super.initState();
    _pagingController.addPageRequestListener((pageKey) {
      BlocProvider.of<PostBloc>(context).add(FetchPosts(page: page, pageSize: pageSize));
    });
  }

  @override
  void dispose() {
    _pagingController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(AppColors.white),
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
        body: BlocListener<PostBloc, PostState>(
          listener: (context, state) {
            if (state is PostError) {
              _pagingController.error = state.message;
            }
            if (state is PostLoaded) {
              final isLastPage = state.posts.length < pageSize;
              if (isLastPage) {
                _pagingController.appendLastPage(state.posts);
              } else {
                final nextPageKey = page * pageSize;
                _pagingController.appendPage(state.posts, nextPageKey);
              }
              page++;
            }
          },
          child: PagedListView<int, PostModel>(
            pagingController: _pagingController,
            builderDelegate: PagedChildBuilderDelegate<PostModel>(
              itemBuilder: (context, item, index) {
                return MainPost(
                  post: item,
                  index: index,
                );
              },
              firstPageProgressIndicatorBuilder: (context) => Center(
                child: CircularProgressIndicator(),
              ),
              newPageProgressIndicatorBuilder: (context) => Center(
                child: CircularProgressIndicator(),
              ),
              noMoreItemsIndicatorBuilder: (context) {
                return Center(child: Text('No more items'));
              },
            ),
          ),
        ));
  }
}
