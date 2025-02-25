import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:trend/features/posts/domain/repositories/post_repository.dart';
import 'package:trend/features/posts/presentation/Manager/post_details_bloc/post_details_state.dart';

import 'post_details_event.dart';

class PostDetailsBloc extends Bloc<PostDetailsEvent, PostDetailsState> {
  final PostRepository postRepository;
  PostDetailsBloc(this.postRepository) : super(PostDetailsInitial()) {
    on<FetchPostDetails>(_onFetchPostDetails);
  }

  Future<void> _onFetchPostDetails(
      FetchPostDetails event, Emitter<PostDetailsState> emit) async {
    emit(PostDetailsLoading());

    final result = await postRepository.getPostDetails(postId:event.postId);

    result.fold(
          (failure) => emit(PostDetailsError(failure.message)),
          (post) => emit(PostDetailsLoaded(post)),
    );
  }
}
