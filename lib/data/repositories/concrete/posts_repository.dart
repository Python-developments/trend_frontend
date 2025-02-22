

import 'package:injectable/injectable.dart';
import 'package:trend/data/dtos/create_post_dto.dart';
import 'package:trend/data/models/core/pagination_data_model.dart';
import 'package:trend/data/models/posts/post_model.dart';
import 'package:trend/data/repositories/abstract/i_posts_repository.dart';
import 'package:trend/data/repositories/abstract/i_repository.dart';

@Singleton(as: IPostsRepository)
class PostsRepository extends IPostsRepository {

  PostsRepository(super.appFlavor, super.httpClient, super.appDatabase, super.logger,);

  @override
  Future<void> createPost({required final CreatePostDto postDto})=>post(url:'posts/create/',parameters: postDto.toJson()   , mapper: emptyMapper,isFormData: true);

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
  Future<PaginationDataModel<PostModel>> getAllPosts({required final int page,required final int perPage})=>getPagination(url: 'posts/all-posts/',
      mapper: PostModel.fromJson,page: page,perPage: perPage, parameters: {});

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
  Future<void> likePost({required final int postId})=>post(url: 'posts/$postId/like/',
      parameters: {}, mapper: emptyMapper);

  @override
  Future<void> unlikePost({required int postId}) {
    // TODO: implement unlikePost
    throw UnimplementedError();
  }


}