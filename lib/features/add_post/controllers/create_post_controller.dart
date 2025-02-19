


import 'package:injectable/injectable.dart';
import 'package:trend/core/controllers/base_controller.dart';
import 'package:trend/core/controllers/controllers_mixins/form_mixin.dart';
import 'package:trend/core/controllers/controllers_mixins/image_picking_mixin.dart';
import 'package:trend/core/presentation/snake_bars/snack_bar_messages.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/dtos/create_post_dto.dart';
import 'package:trend/data/errors/core_errors.dart';
import 'package:trend/data/repositories/abstract/i_posts_repository.dart';

@injectable
class CreatePostController extends BaseController with FormMixin,SingleImagePickingMixin{
  final IPostsRepository postsRepository;

  CreatePostController( this.postsRepository,super.logger,super.appRouter,super.snakeBarShower);
  @override
  Future<void> afterSuccessSubmitting()async {
    snakeBarShower.showSnakeBar(SnakeBarMessages.successCreatingPost, ToastType.success);
  }

  @override
  Future<void> submitFunction() {
    if(!selectedImage.isLocal) {
      throw EmptyFieldError(fieldName: 'image');
    }
    return postsRepository.createPost(postDto: CreatePostDto(
      image: selectedImage.fileDto!, description: valueOf('description')!));
  }}