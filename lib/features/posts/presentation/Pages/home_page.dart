import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
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
  late ScrollController _scrollController;

  
  void _getUserData() async {
    int c = await SharedPreferencesDemo.loadUserData().id;
    BlocProvider.of<CurrentUserBloc>(context)
        .add(GetPostForCurrentUserEvent(id: c));
    BlocProvider.of<NotificationBloc>(context)
        .add(FetchNotificationsEvent());
  }
  
  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController();
    _scrollController.addListener(_onScroll);
    _getUserData();
  }

  void _onScroll() {
    final posts = BlocProvider.of<PostBloc>(context).allPosts;

    // تحقق إذا كانت نسبة التمرير وصلت إلى 80%
    if (!isloading) {
      if (_scrollController.position.pixels >=
          _scrollController.position.maxScrollExtent * 0.8) {
        if (ApiEndpoints.Nextpage?.isNotEmpty ?? false) {
          BlocProvider.of<PostBloc>(context).add(FetchPosts());
        }
      }
    }
  }

  @override
  void dispose() {
    _scrollController.dispose(); // تنظيف الـ ScrollController
    super.dispose();
  }

  final GlobalKey<RefreshIndicatorState> _refreshIndicatorKey =
      GlobalKey<RefreshIndicatorState>();
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
      body: RefreshIndicator(
        key: _refreshIndicatorKey,
        color: Colors.white,
        backgroundColor: Colors.black,
        strokeWidth: 2.0,
        onRefresh: () async {
          ApiEndpoints.setnext("");
          BlocProvider.of<PostBloc>(context).add(FetchPosts());
        },
        child: BlocConsumer<PostBloc, PostState>(
          listener: (context, state) {
            if (state is PostError) {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Error: ${state.message}')),
              );
            }
          },
          builder: (context, state) {
            final posts = BlocProvider.of<PostBloc>(context).allPosts;
            print(posts);
            return ListView.builder(
              physics: BouncingScrollPhysics(),
              controller: _scrollController,
              padding: EdgeInsets.zero,
              itemCount: posts.length + 1, // إضافة عنصر مؤشر التحميل
              itemBuilder: (context, index) {
                if (index == posts.length) {
                  // إذا كان العنصر هو عنصر التحميل
                  return ShimmerPost();
                }

                return MainPost(
                  post: posts[index],
                  index: index,
                );
              },
            );
          },
        ),
      ),
    );
  }
}
