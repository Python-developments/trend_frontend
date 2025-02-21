import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/data/models/posts/post_model.dart';
import 'package:trend/features/posts/presentation/widgets/CommentSheet_Header.dart';
import 'package:trend/features/posts/presentation/widgets/Networkimage.dart';
import 'package:trend/features/posts/presentation/widgets/comment_widget.dart';
import 'package:trend/features/posts/presentation/widgets/customTextFiled.dart';
import 'package:trend/shared/const/app_links.dart';


class CommentSheet extends StatefulWidget {
  const CommentSheet({required this.post, super.key});
  final PostModel post;
  @override
  _CommentSheetState createState() => _CommentSheetState();
}

class _CommentSheetState extends State<CommentSheet> {
  String avatar = '/media/profile_images/default_image.jpg';


  final TextEditingController _controller = TextEditingController();

  bool isReply = false;
  int commentId = 0;
  FocusNode focusNode = FocusNode();

  bool isMe = false;
  @override
  Widget build(final BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height - 50.sp,
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.vertical(top: Radius.circular(20))),
      child: Stack(
        children: [
          Column(
            children: [
              CommentsheetHeader(
                commentcount: '${widget.post.commentsCount}',
              ),
              Expanded(
                child: ListView(
                  children: [
                    ListView(
                      reverse: true,
                      shrinkWrap: true, // يسمح بـ ListView أن يكون بحجم التعليقات فقط
                      physics: NeverScrollableScrollPhysics(), // لمنع التمرير داخل ListView الداخلية
                      children: widget.post.comments.map((final comment) {
                        return CommentWidget(comment);
                      }).toList(),
                    ),
                    SizedBox(height: MediaQuery.of(context).viewInsets.bottom > 0 ? MediaQuery.of(context).size.height * 0.5 : 100),
                  ],
                ),
              )
            ],
          ),
          Positioned(
            bottom: MediaQuery.of(context).viewInsets.bottom > 0 ? MediaQuery.of(context).viewInsets.bottom : 0,
            left: 0,
            right: 0,
            child: ColoredBox(
              color: Colors.white,
              child: Padding(
                padding: EdgeInsets.only(left: 16.w, right: 1.w, top: 8.h, bottom: MediaQuery.of(context).viewInsets.bottom > 0 ? 5 : 8.h),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {},
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
                        onChanged: (final String) {
                          setState(() {});
                        },
                        onTap: () {},
                      ),
                    ),
                    SizedBox(width: 10.w),
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
  @override
  void dispose() {
    focusNode.dispose();
    super.dispose();
  }
}
