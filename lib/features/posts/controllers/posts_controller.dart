import 'package:injectable/injectable.dart';
import 'package:trend/core/controllers/list_data_loader.dart';
import 'package:trend/core/controllers/pagination_list_data_loader.dart';
import 'package:trend/data/errors/core_errors.dart';
import 'package:trend/data/errors/custom_error.dart';
import 'package:trend/data/models/core/pagination_data_model.dart';
import 'package:trend/data/models/posts/post_model.dart';
import 'package:trend/data/repositories/abstract/i_posts_repository.dart';

@injectable
class PostsController extends ListDataLoader<PostModel> {
  final IPostsRepository postsRepository;

  PostsController(this.postsRepository, super.logger, super.appRouter, super.snakeBarShower);

  @override
  Future<List<PostModel>> listGetter() => postsRepository.getAllPosts();
  @override
  CustomError? get emptyError => EmptyDataError(entityName: 'posts');
}
