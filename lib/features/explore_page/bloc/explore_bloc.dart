import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:trend/features/explore_page/data/ExpoRepository.dart';
import 'package:trend/features/posts/data/models/post_model.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  final PagingController<int, PostModel> pagingController = PagingController(firstPageKey: 0, invisibleItemsThreshold: 18);
  int page = 1;
  int pageSize = 18;
  ExploreBloc() : super(ExploreLoading()) {
    on<FetchPostsByPage>((event, emit) async {
      try {
        List<PostModel> posts = await ExpoRepository().getPostsByPageNumber(pageNumber: page, pageSize: pageSize);
        if (posts.length < pageSize) {
          pagingController.appendLastPage(posts);
        } else {
          pagingController.appendPage(posts, (++page) * pageSize);
        }
      } catch (e) {
        pagingController.error = e;
      }
    });
    on<RefreshPosts>((event, emit) async {
      pagingController.refresh();
    });
  }
}
