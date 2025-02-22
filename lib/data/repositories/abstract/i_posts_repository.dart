


import 'package:trend/data/dtos/create_post_dto.dart';
import 'package:trend/data/models/core/pagination_data_model.dart';
import 'package:trend/data/models/posts/post_model.dart';
import 'package:trend/data/repositories/abstract/i_repository.dart';

abstract class IPostsRepository extends IRepository {
  IPostsRepository(super.appFlavor, super.httpClient, super.appDatabase, super.logger,);

  Future<void> createPost({required final CreatePostDto postDto});

  Future<List<PostModel>> getUserPosts({required final int userId});

  Future<PaginationDataModel<PostModel>> getAllPosts({required final int page,required final int perPage});
  Future<void> createReply({required final int postId, required final int commentId, required final String comment});
  Future<void> createComment({required final int postId,required final String comment});
  Future<void> deleteComment({required final int postId,required final int commentId});
  Future<void> likeComment({required final int commentId});
  Future<void> likePost({required final int postId});
  Future<void> unlikePost({required final int postId});
  Future<bool> deletePost({required final int postId});
}