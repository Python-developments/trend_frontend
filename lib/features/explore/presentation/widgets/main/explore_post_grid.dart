import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shimmer/shimmer.dart';
import 'package:trend/features/explore/data/models/local/explor_explore_post_container_model.dart';
import 'package:trend/features/explore/presentation/manager/explore/explore_state.dart';
import 'package:trend/features/explore/presentation/widgets/for_you/explore_explore_post_container.dart';
import '../../../../../shared/const/colors.dart';
import '../../../../../shared/core/enum.dart';
import '../../manager/explore/explore_bloc.dart';

class ExplorePostGrid extends StatefulWidget {
  const ExplorePostGrid({Key? key}) : super(key: key);

  @override
  _ExplorePostGridState createState() => _ExplorePostGridState();
}

class _ExplorePostGridState extends State<ExplorePostGrid> {
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ExploreBloc, ExploreState>(
      builder: (context, state) {
        switch (state.requestStatus) {
          case RequestStates.loading:
            return GridView.builder(
              shrinkWrap: true,
              itemCount: 15, // Instagram-style skeleton placeholders
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                mainAxisSpacing: 2,
                crossAxisSpacing: 2,
                crossAxisCount: 3,
              ),
              itemBuilder: (context, index) {
                return Shimmer.fromColors(
                  baseColor: Color(AppColors.greyLight),
                  highlightColor: Colors.grey[100]!,
                  child: Container(
                    decoration: BoxDecoration(color: Color(AppColors.greyLighter)),
                  ),
                );
              },
            );
          case RequestStates.loaded:
            return RefreshIndicator(
              color: Colors.white,
              backgroundColor: Colors.grey,
              onRefresh: () => Future.sync(() {}),
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 2,
                  crossAxisSpacing: 2,
                ),
                itemCount: state.allPost.results.length,
                itemBuilder: (context, index) {
                  final post = state.allPost.results[index];
                  final model = ExplorExplorePostContainerModel(
                    imgUrl: post.image != null
                        ? post.image
                        : "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcR9nJ_3Dmrsxec-D2q43IRnN7ntGIRa4qO8qXONXdxzdX053t3OUSivYJoBr-uSTpOVEcY&usqp=CAU",
                  );

                  return SizedBox(
                    width: double.infinity,
                    height: 200,
                    child: ExploreExplorePostContainer(model: model),
                  );
                },
              ),
            );
          case RequestStates.error:
          // return Center(
          //   child: Text(state.getExploreAllPostMessage),
          // );
          case RequestStates.empty:
            return const Center(
              child: Text('No posts available'),
            );
        }
      },
    );
  }
}
