import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:trend/core/presentation/app_style.dart';

class ExploreMainAppBarContainer extends StatelessWidget
    implements PreferredSizeWidget {
  const ExploreMainAppBarContainer({super.key});

  @override
  Size get preferredSize =>  Size.fromHeight(kToolbarHeight.h < 56? 56 : kToolbarHeight.h);

  @override
  Widget build(final BuildContext context) {
    return SafeArea(
      child: InkWell(
        onTap: () {
        },
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 11),
          child: Row(
            children: [
              // Back Button
              Flexible(
                child: FittedBox(
                  fit: BoxFit.fill,
                  child: IconButton(
                    onPressed: () {

                    },
                    icon: Icon(
                      FontAwesomeIcons.userFriends,
                      size: 28,
                      color: AppStyle.black,
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              // Basic Container for Search (instead of TextFormField)
              Expanded(
                flex: 7,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 9),
                  decoration: BoxDecoration(
                    color: AppStyle.black.shade400.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Row(
                    children: [
                      SizedBox(width: 5),
                      Icon(
                        FontAwesomeIcons.search,
                        size: 16,
                        color: Colors.black,
                      ),
                      SizedBox(width: 8),
                      Text(
                        'Search',
                        style: AppStyle.textTheme.bodyMedium!.copyWith(
                          color: AppStyle.black.shade400,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
