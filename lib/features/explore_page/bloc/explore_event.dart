part of 'explore_bloc.dart';

sealed class ExploreEvent extends Equatable {
  const ExploreEvent();

  @override
  List<Object> get props => [];
}

class FetchPostsByPage extends ExploreEvent {
  final int page;
  FetchPostsByPage({required this.page});
  @override
  List<Object> get props => [page];
}
