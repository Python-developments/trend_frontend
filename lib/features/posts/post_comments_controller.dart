/*

import 'package:trend/core/controllers/base_controller.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:trend/data/models/posts/post_model.dart';
import 'package:trend/data/repositories/abstract/i_posts_repository.dart';

part 'post_controller.g.dart';

@injectable
class PostController extends PostControllerBase with _$PostController {
  PostController(
      @factoryParam super.post,
      super.postsRepository,
      super.logger,super.appRouter,super.snakeBarShower
      );
}

abstract class PostControllerBase extends BaseController with Store {
  final PostModel post;
  final IPostsRepository postsRepository;

  PostControllerBase(this.post, this.postsRepository, super.logger,super.appRouter,super.snakeBarShower){
    isLikedPost=post.isLiked;
  }

  @observable
  bool isLikedPost=false;

  @action
  Future<bool> toggleIsLiked() async => runStoreSecondaryFunction(() async {
    final bool isLiked = post.isLiked;
    if (isLiked) {
      await postsRepository.unlikePost(postId: post.id);
    } else {
      await postsRepository.likePost(postId: post.id);
    }
    post = post.copyWith(isLiked: !post.isLiked);

    BottomSnackBar.show(
        isLiked
            ? SnackBarMessages.postUnlikedSuccess
            : SnackBarMessages.postLikedSuccess,
        ToastType.success);
  });
}
*/
