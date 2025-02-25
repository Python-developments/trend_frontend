import 'package:equatable/equatable.dart';
import 'package:trend/features/posts/data/models/post_details_model.dart';
abstract class PostDetailsState extends Equatable {
  @override
  List<Object> get props => [];
}

class PostDetailsInitial extends PostDetailsState {}

class PostDetailsLoading extends PostDetailsState {}

class PostDetailsLoaded extends PostDetailsState {
  final PostDetailsModel postDetails;

  PostDetailsLoaded(this.postDetails);

  @override
  List<Object> get props => [postDetails];
}

class PostDetailsError extends PostDetailsState {
  final String message;

  PostDetailsError(this.message);

  @override
  List<Object> get props => [message];
}
