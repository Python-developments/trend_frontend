


import 'package:trend/data/dtos/create_post_dto.dart';
import 'package:trend/data/models/posts/post_model.dart';
import 'package:trend/data/repositories/abstract/i_repository.dart';

abstract class IPostsRepository extends IRepository {
  IPostsRepository(super.appFlavor, super.httpClient, super.appDatabase, super.logger,);

  Future<void> createPost({required final CreatePostDto postDto});

  Future<List<PostModel>> getUserPosts({required final int userId});

  Future<List<PostModel>> getAllPosts();
  Future<void> createReply({required final int postId, required final int commentId, required final String comment});
  Future<void> createComment({required final int postId,required final String comment});
  Future<void> deleteComment({required final int postId,required final int commentId});
  Future<void> likeComment({required final int commentId});
  Future<bool?> likePost({required final int postId});
  Future<bool> deletePost({required final int postId});
}