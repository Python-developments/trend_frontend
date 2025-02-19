import 'package:trend/data/dtos/file_dto.dart';
import 'package:trend/third_parties_modules/abstract/i_module.dart';


abstract class IImagePickingModule extends IModule {
  Future<FileDto?> pickImage({required final bool isFromGallery, required final bool withCrop});

}
