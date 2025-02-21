import 'package:flutter/material.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/core/presentation/widgets/custom_pagination_list_data_loader_widget.dart';
import 'package:trend/dependencies.dart';
import 'package:trend/features/explore/presentation/controllers/explore_posts_controller.dart';

import 'package:trend/features/explore/presentation/widgets/main/explore_main_app_bar.dart';
import 'package:trend/features/explore/presentation/widgets/main/explore_post_grid.dart';

class ExploreMainPage extends StatelessWidget {
  const ExploreMainPage({super.key});

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
          backgroundColor: AppStyle.white,
          appBar: ExploreMainAppBarContainer(),
          body: SafeArea(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 14.0, left: 12.0, right: 12.0, bottom: 10.0),
                child: Text(
                  'Explore',
                  style: AppStyle.textTheme.bodyMedium!
                      .copyWith(color: AppStyle.black),
                ),
              ),
              // explore post grid
              Expanded(child: CustomPaginationListDataLoaderWidget(
                dataLoader: getIt<ExplorePostsController>(),
                  dataToWidgetMapper: (final posts) {
                  return ExplorePostGrid(posts: posts,);
                }
              ))
            ],
          )),
    );
  }
}
