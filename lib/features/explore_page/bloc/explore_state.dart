part of 'explore_bloc.dart';

sealed class ExploreState extends Equatable {
  final List<PostModel> posts;
  final bool hasReachedMax;
  const ExploreState({this.posts = const [], this.hasReachedMax = false});

  @override
  List<Object> get props => [posts];
}

final class ExploreLoading extends ExploreState {}

final class ExploreLoad extends ExploreState {
  const ExploreLoad({required List<PostModel> posts}) : super(posts: posts);
}

final class ExploreError extends ExploreState {
  final String message;
  const ExploreError({required this.message});
}
