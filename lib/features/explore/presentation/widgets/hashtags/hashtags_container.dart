/*
import 'package:flutter/material.dart';
import 'package:trend/core/presentation/app_style.dart';


import '../../../data/models/local/hashtags_details.dart';
import 'package:intl/intl.dart';

class HashtagsContainer extends StatelessWidget {
  const HashtagsContainer({Key? key, required this.model})
      : super(key: key);

  final HashtagsDetailsModel model;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppStyle.white,
      child: ListTile(
        contentPadding:
            EdgeInsets.symmetric(horizontal: 13, vertical: 7),
        leading: CircleAvatar(
          backgroundColor: AppStyle.black.shade100,
          radius: 24,
          child: Icon(
            Icons.tag,
            color: AppStyle.black.shade400,
          ),
        ),
        title: Text(
          model.author,
          style: AppStyle.styleBold16,
        ),
        subtitle: Text(
          model.posts_count,
          style: AppStyle.textTheme!.bodySmall!.copyWith(
              color: AppStyle.black.shade400,
          ),
        ),
        trailing: Text(
          formatCreatedAt(model.created_at),
          style: AppStyle.textTheme!.bodySmall!.copyWith(
              color: AppStyle.black.shade400,
          ),
        ),
        horizontalTitleGap: 14,
        minTileHeight: 60,
        onTap: () {
          // Handle item tap
        },
      ),
    );
  }

  String formatCreatedAt(String createdAt) {
    // Parse the string to DateTime
    DateTime dateTime = DateTime.parse(createdAt);

    // Extract the day, month, year, hour, and minute
    String formattedDate =
        '${dateTime.month.toString().padLeft(2, '0')}-${dateTime.day.toString().padLeft(2, '0')} ${dateTime.hour.toString().padLeft(2, '0')}:${dateTime.minute.toString().padLeft(2, '0')}';

    return formattedDate;
  }
}
*/
