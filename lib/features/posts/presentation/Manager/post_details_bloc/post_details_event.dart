import 'package:equatable/equatable.dart';

abstract class PostDetailsEvent extends Equatable {
  @override
  List<Object> get props => [];
}

class FetchPostDetails extends PostDetailsEvent {
  final int postId;

  FetchPostDetails(this.postId);

  @override
  List<Object> get props => [postId];
}
