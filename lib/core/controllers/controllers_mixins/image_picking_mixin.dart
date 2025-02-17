import 'package:mobx/mobx.dart';
import 'package:trend/core/controllers/base_controller.dart';
import 'package:trend/data/dtos/file_dto.dart';

mixin SingleImagePickingMixin on BaseController {
  @observable
  FileDto? selectedImage;
  @action
  void changeSelectedImage(final FileDto? newImage) => selectedImage = newImage;
}

mixin MultipleImagePickingMixin on BaseController {
  @observable
  ObservableList<FileDto?> images = ObservableList.of([null]);
  @action
  void increaseImagesCounter() => images.add(null);
  @action
  void removeImage({required final int imageIndex}) =>
      imageIndex == 0 && images.length == 1
          ? () {}
          : images.removeAt(imageIndex);
  @action
  void changeImage(
          {required final int index, required final FileDto? newImage}) =>
      images[index] = newImage;
}
