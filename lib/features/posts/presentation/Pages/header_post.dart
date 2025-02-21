import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:trend/data/models/posts/post_model.dart';
import 'package:trend/features/posts/presentation/widgets/post_details.dart';
import 'package:trend/shared/const/app_links.dart';


class HeaderPost extends StatelessWidget {
  final PostModel post;
  HeaderPost({required this.post, super.key});
  String getTimeAgoShort(final DateTime createdAt) {
    final currentTime = DateTime.now();
    final difference = currentTime.difference(createdAt);

    if (difference.inDays > 0) {
      return '${difference.inDays}d'; // e.g. "1 d"
    } else if (difference.inHours > 0) {
      return '${difference.inHours}h'; // e.g. "5 h"
    } else if (difference.inMinutes > 0) {
      return '${difference.inMinutes}m'; // e.g. "10 m"
    } else {
      return '${difference.inSeconds}s'; // e.g. "30 s"
    }
  }

  bool isMe = false;
  bool is_vervied = false;
  @override
  Widget build(final BuildContext context) {
    final String timeAgo = getTimeAgoShort(post.createdAt);

    return ColoredBox(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 10, bottom: 10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    GestureDetector(
                      onTap: () async {
                                            },
                      child: CircleAvatar(
                        radius: 16,
                        backgroundColor: Colors.transparent,
                        child: CachedNetworkImage(
                          imageUrl: post.avatar ?? '${ApiEndpoints.baseUrl}/media/profile_images/default_image.jpg', // رابط الصورة
                          imageBuilder: (final context, final imageProvider) => CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.white,
                            backgroundImage: imageProvider, // الصورة المحمّلة
                          ),
                          placeholder: (final context, final url) => CircleAvatar(
                            radius: 16,
                            backgroundImage: AssetImage('assets/images/avatar.jpg'), // صورة أثناء التحميل
                          ),
                          errorWidget: (final context, final url, final error) => CircleAvatar(
                            radius: 16,
                            backgroundImage: AssetImage('assets/images/avatar.jpg'), // صورة في حال الخطأ
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    GestureDetector(
                      onTap: () async {
                      },
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            post.author ?? 'Unknown Author', // Fallback if author is null
                            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.w500, fontSize: 14),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Visibility(
                      visible: is_vervied,
                      child: Icon(
                        Icons.verified,
                        size: 12.h,
                        color: Colors.blue,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Text(
                      timeAgo,
                      style: TextStyle(color: Colors.black, fontSize: 13, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(width: 5.w),
                    GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                          context: context,
                          builder: (final BuildContext context) {
                            return PostDetails(
                              post: post,
                              );
                          },
                        );
                      },
                      child: const Icon(
                        Icons.more_horiz,
                        color: Colors.grey,
                        size: 19,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
