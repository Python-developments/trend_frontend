import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';import 'package:trend/data/models/posts/comment_model.dart';
import 'package:trend/features/posts/presentation/widgets/Networkimage.dart';
import 'package:trend/features/posts/presentation/widgets/commentContent.dart';
import 'package:trend/features/posts/presentation/widgets/replayComment.dart';

class CustomCommentBody extends StatelessWidget {
  const CustomCommentBody({required this.comment, super.key, });
  final CommentModel comment;


  @override
  Widget build(final BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () async {},
          child: Networkimages(
            size: 20,
            imageUrl: '',
          ),
        ),
        SizedBox(width: 10.w),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                comment.author,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400, color: Color(0xff1F2232)),
              ),
              Commentcontent(content: comment.content),
              Row(
                children: [
                  Text(
                    comment.createdAt.toString(),
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 10.sp,
                      color: Color(0xff8697AC),
                    ),
                  ),
                  Container(
                    height: 4,
                    width: 4,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Color(0xffE7ECF0)),
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Text(
                      '  Reply ',
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 10.sp,
                        color: Color(0xff8697AC),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2,
                  ),
                  Row(
                    children: [
                      GestureDetector(
                        onTap: () { },
                        child: Row(
                          children: [
                            Container(
                              height: 4,
                              width: 4,
                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(100), color: Color(0xffE7ECF0)),
                            ),
                            Text(
                              '  View ${comment.replies?.length}',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 10.sp,
                                color: Color(0xff8697AC),
                              ),
                            ),
                            comment.replies?.length == 1
                                ? Text(
                                    ' replie',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp,
                                      color: Color(0xff8697AC),
                                    ),
                                  )
                                : Text(
                                    ' replies',
                                    style: TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 10.sp,
                                      color: Color(0xff8697AC),
                                    ),
                                  ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(height: 3.h),
              SizedBox(
                height: 10.sp,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemCount: comment.replies?.length ?? 0,
                itemBuilder: (final context, final commentsIndex) {
                  final CommentModel? reply = comment.replies?[commentsIndex];
                  return Replaycomment(
                    comment: comment, // استخدام الـ reply بدلاً من comment
                    reply: reply!,
                  );
                },
              ),
              SizedBox(
                height: 14,
                child: Row(
                  children: [
                    SizedBox(
                      width: 15.w,
                      height: 1,
                      child: Divider(
                        thickness: 0.3,
                        color: Colors.grey,
                        height: 1,
                      ),
                    ),
                    GestureDetector(
                      onTap:(){},
                      child: Text(
                        'Hide replies',
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          fontSize: 10.sp,
                          color: Color(0xff8697AC),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
