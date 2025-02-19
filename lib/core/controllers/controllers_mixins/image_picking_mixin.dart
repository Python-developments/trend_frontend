import 'package:mobx/mobx.dart';
import 'package:trend/core/controllers/base_controller.dart';
import 'package:trend/data/dtos/file_dto.dart';
import 'package:trend/data/models/core/image_model.dart';

class ImagePickingState {
  final FileDto? fileDto;
  final ImageModel? imageModel;

  ImagePickingState({required this.fileDto, required this.imageModel});

  factory ImagePickingState.local({required final FileDto fileDto}) => ImagePickingState(fileDto: fileDto, imageModel: null);
  factory ImagePickingState.network({required final ImageModel imageModel}) => ImagePickingState(fileDto: null, imageModel: imageModel);
  factory ImagePickingState.empty() => ImagePickingState(fileDto: null, imageModel: null);

  bool get isEmpty => fileDto == null && imageModel == null;
  bool get isNetwork => imageModel != null;
  bool get isLocal => fileDto != null;
}

mixin SingleImagePickingMixin on BaseController {
  @observable
  ImagePickingState selectedImage = ImagePickingState.empty();
  @action
  void changeSelectedImage(final FileDto newImage) => selectedImage = ImagePickingState.local(fileDto: newImage);
}

mixin MultipleImagePickingMixin on BaseController {
  @observable
  ObservableList<ImagePickingState> images = ObservableList.of([ImagePickingState.empty()]);
  @action
  void increaseImagesCounter() => images.add(ImagePickingState.empty());
  @action
  void addImage(final FileDto fileDto) => images.add(ImagePickingState.local(fileDto: fileDto));
  @action
  void removeImage({required final int imageIndex}) => imageIndex == 0 && images.length == 1 ? () {} : images.removeAt(imageIndex);
  @action
  void changeImage({required final int index, required final FileDto newImage}) => images[index] = ImagePickingState.local(fileDto: newImage);
}
