

import 'package:injectable/injectable.dart';
import 'package:trend/data/dtos/create_post_dto.dart';
import 'package:trend/data/models/posts/post_model.dart';
import 'package:trend/data/repositories/abstract/i_posts_repository.dart';
import 'package:trend/data/repositories/abstract/i_repository.dart';
import 'package:trend/features/explore/data/models/remote/get_all_post_model.dart';

@Singleton(as: IPostsRepository)
class PostsRepository extends IPostsRepository {

  PostsRepository(super.appFlavor, super.httpClient, super.appDatabase, super.logger,);

  @override
  Future<void> createPost({required final CreatePostDto postDto})=>post(url:'posts/create',parameters: postDto.toJson()   , mapper: emptyMapper,isFormData: true);

  @override
  Future<void> createComment({required final int postId, required final String comment}) {
    // TODO: implement createComment
    throw UnimplementedError();
  }

  @override
  Future<void> createReply({required final int postId, required final int commentId, required final String comment}) {
    // TODO: implement createReply
    throw UnimplementedError();
  }

  @override
  Future<void> deleteComment({required final int postId, required final int commentId}) {
    // TODO: implement deleteComment
    throw UnimplementedError();
  }

  @override
  Future<bool> deletePost({required final int postId}) {
    // TODO: implement deletePost
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getAllPosts() {
    // TODO: implement getAllPosts
    throw UnimplementedError();
  }

  @override
  Future<List<PostModel>> getUserPosts({required final int userId}) {
    // TODO: implement getUserPosts
    throw UnimplementedError();
  }

  @override
  Future<void> likeComment({required final int commentId}) {
    // TODO: implement likeComment
    throw UnimplementedError();
  }

  @override
  Future<bool?> likePost({required final int postId}) {
    // TODO: implement likePost
    throw UnimplementedError();
  }


}