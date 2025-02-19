import 'package:flutter/material.dart';

class HashtagsListSearch extends StatelessWidget {
  const HashtagsListSearch({super.key});

  @override
  Widget build(final BuildContext context) {
    return Container();
    /*
    return BlocBuilder<HashtagsBloc, HashtagsSearchState>(
      builder: (context, state) {
        print("State Request Status: ${state.requestStatus}");

        switch (state.requestStatus) {
          case RequestStates.loading:
            return _buildLoadingList();
          case RequestStates.loaded:
            return _buildHashtagList(state);
          case RequestStates.error:
            return _buildErrorMessage(state.searchMessage);
          case RequestStates.empty:
            return const SliverToBoxAdapter(child: SizedBox.shrink());
        }
      },
    );*/
  }
/*
  Widget _buildLoadingList() {
    return SliverList.builder(
      itemCount: 9, // Instagram-style skeleton placeholders
      itemBuilder: (context, index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: 2),
          child: Skeletonizer.zone(
            effect: ShimmerEffect(
              duration: const Duration(milliseconds: 1500),
              baseColor: AppStyle.black.shade100,
              highlightColor: AppStyle.white,
            ),
            child: Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              color: AppStyle.white,
              child: const ListTile(
                leading: Icon(
                  FontAwesomeIcons.hashtag,
                  color: AppStyle.black.shade400,
                ),
                title: Bone.text(words: 2),
                subtitle: Bone.text(),
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildHashtagList(HashtagsSearchState state) {
    final hashtags = state.searchResult.hashtags ?? [];

    return SliverList.builder(
      itemCount: hashtags.length,
      itemBuilder: (context, index) {
        final hashtag = hashtags[index];

        return HashtagsContainer(
          model: HashtagsDetailsModel(
            author: hashtag.name ?? "Unknown",
            author_id: "${hashtag.id }",
            created_at: "${hashtag.createdAt}",
            posts_count: hashtag.postsCount?.toString() ?? "0",
          ),
        );
      },
    );
  }

  Widget _buildErrorMessage(String message) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: 200,
        child: Center(child: Text(message)),
      ),
    );
  }*/
}
