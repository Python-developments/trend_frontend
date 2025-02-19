import 'package:flutter/material.dart';

import 'package:trend/features/explore/presentation/widgets/hashtags/hashtags_list_search.dart';




class HashtagsSearch extends StatelessWidget {
  const HashtagsSearch({super.key});

  @override
  Widget build(final BuildContext context) {
    return CustomScrollView(
       slivers: [
         HashtagsListSearch()
       ],
    );
  }
}
