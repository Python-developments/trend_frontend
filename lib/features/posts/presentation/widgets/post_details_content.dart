import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/features/bottom_nav_bar/Bloc/Bottom_Nav_Bloc.dart';
import 'package:trend/features/bottom_nav_bar/Bloc/Bottom_Nav_event.dart';
import 'package:trend/features/posts/data/models/CommentModel.dart';
import 'package:trend/features/posts/data/models/post_details_model.dart';
import 'package:trend/features/posts/presentation/Manager/Bloc_post/post_bloc.dart';
import 'package:trend/features/posts/presentation/Manager/Bloc_post/post_event.dart';
import 'package:trend/features/posts/presentation/Manager/Bloc_post/post_state.dart';
import 'package:trend/features/posts/presentation/Pages/activities_post.dart';
import 'package:trend/features/posts/presentation/Pages/body_post.dart';
import 'package:trend/features/posts/presentation/Pages/header_post.dart';
import 'package:trend/features/posts/presentation/widgets/Networkimage.dart';
import 'package:trend/features/posts/presentation/widgets/comment_sheet.dart';
import 'package:trend/features/posts/presentation/widgets/comment_widget.dart';
import 'package:trend/features/posts/presentation/widgets/customTextFiled.dart';
import 'package:trend/shared/const/app_links.dart';
import 'package:trend/shared/core/local/SharedPreferencesDemo.dart';

import '../../data/models/post_model.dart';

class PostDetailsContent extends StatefulWidget {
  final PostDetailsModel postDetails;

  const PostDetailsContent({Key? key, required this.postDetails}) : super(key: key);

  @override
  State<PostDetailsContent> createState() => _PostDetailsContentState();
}

class _PostDetailsContentState extends State<PostDetailsContent> {
  String avatar = "/media/profile_images/default_image.jpg";
  void initState() {
    super.initState();
    _loadAvatar();
  }

  void _loadAvatar() async {
    final loadedAvatar = await SharedPreferencesDemo.getAvatar();
    setState(() {
      avatar = loadedAvatar;
    });
  }

  @override
  void dispose() {
    super.dispose();
  }

  final TextEditingController _controller = TextEditingController();

  bool isReply = false;
  int commentId = 0;
  FocusNode focusNode = FocusNode();
  replyFunction(Comment comment) {
    isReply = true;
    commentId = comment.id ?? 0;
    _controller.text = "@" + (comment.author ?? '') + ' ';
    focusNode.requestFocus();
  }


  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostBloc,PostState>(
      builder: (context,state) {
        bool hasPostInState=state is PostLoaded &&
            state.posts.where((post)=>post.id==widget.postDetails.id).isNotEmpty;
        PostModel currentPost =hasPostInState? state.posts.firstWhere((post)=>post.id==widget.postDetails.id):

            PostModel.fromPostDetails(widget.postDetails);
        print('Wiso current post ${currentPost.comments}');


      return Stack(
          fit: StackFit.expand,
          children: [
            SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 24.h,),
                  HeaderPost(post: currentPost,showArrowBack: true,),
                  BodyPost(post: currentPost),
                  ActivitiesPost(
                    post: currentPost,
                  ),
                  ...currentPost.comments?.map((comment)=>CommentWidget(comment,replyFunction))??[],

                  SizedBox(height: 64.h,)
                ],
              ),
            ),
            Positioned(
              bottom: 0,left: 0,right: 0,
              child: Container(
                color: Colors.white,
                child: Padding(
                  padding: EdgeInsets.only(left: 16.w, right: 1.w, top: 8.h, bottom: MediaQuery.of(context).viewInsets.bottom > 0 ? 5 : 8.h),
                  child: Row(
                    children: [
                      GestureDetector(
                        onTap: () {
                          BlocProvider.of<BottomNavBloc>(context).add(BottomNavItemSelected(4));
                        },
                        child: Networkimages(
                          imageUrl: '${ApiEndpoints.baseUrl}$avatar',
                          size: 20,
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: CustomTextFiledForComment(
                          controller: _controller,
                          onChanged: (String) {
                            setState(() {});
                          },
                          onTap: () {
                            if (_controller.text.isNotEmpty) {
                              if (isReply) {
                                context.read<PostBloc>().add(AddCommentOnComment(postId: widget.postDetails.id ?? 0, commentId: commentId, content: _controller.text));
                              } else {
                                context.read<PostBloc>().add(AddComment(postId: widget.postDetails.id!, content: _controller.text));
                              }
                              _controller.text = "";
                              commentId = 0;
                              isReply = false;
                            } else {
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text("Please Enter Any Text",)));
                            }
                          },
                        ),
                      ),
                      SizedBox(width: 10.w),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}
