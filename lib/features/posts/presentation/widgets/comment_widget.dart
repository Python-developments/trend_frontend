import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';import 'package:trend/data/models/posts/comment_model.dart';
import 'package:trend/features/posts/presentation/widgets/custom_comment_body.dart';

class CommentWidget extends StatefulWidget {
  CommentModel comment;
  CommentWidget(this.comment, {super.key});
  @override
  State<CommentWidget> createState() => _CommentWidgetState();
}

class _CommentWidgetState extends State<CommentWidget> {

  @override
  Widget build(final BuildContext context) {

    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.h, horizontal: 16.w),
      child: Stack(
        children: [
          CustomCommentBody(
            comment: widget.comment,
          ),
          Positioned.fill(
            top: 20,
            child: Align(
              alignment: Alignment.centerRight,
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: (widget.comment.isLiked ?? false)
                        ? SvgPicture.asset(
                            'assets/icons/like_fill.svg',
                            height: 17,
                            width: 17,
                            fit: BoxFit.none,
                          ) // Filled like icon
                        : SvgPicture.asset(
                            'assets/icons/like.svg',
                            height: 17,
                            width: 17,
                            fit: BoxFit.none,
                          ),
                  ),
                  Text(
                    '2',
                    style: TextStyle(
                      fontSize: 9.sp,
                      fontWeight: FontWeight.bold,
                      color: const Color.fromARGB(255, 129, 129, 129),
                    ),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
