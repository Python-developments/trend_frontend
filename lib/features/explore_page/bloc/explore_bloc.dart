import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:trend/features/explore_page/data/ExpoRepository.dart';
import 'package:trend/features/posts/data/models/post_model.dart';

part 'explore_event.dart';
part 'explore_state.dart';

class ExploreBloc extends Bloc<ExploreEvent, ExploreState> {
  ExploreBloc() : super(ExploreLoading()) {
    on<FetchPostsByPage>((event, emit) async {
      emit(ExploreLoading());
      try {
        List<PostModel> posts = await ExpoRepository().getPostsByPageNumber(pageNumber: event.page);
        emit(ExploreLoad(posts: posts));
      } catch (e) {
        emit(ExploreError(message: e.toString()));
      }
    });
  }
}
