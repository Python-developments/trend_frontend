import 'package:flutter/foundation.dart';
import 'package:trend/third_parties_modules/abstract/i_module.dart';

typedef PickedImage = (String fileName, String filePath, Uint8List bytes);

abstract class IImagePickingModule extends IModule {
  Future<PickedImage?> pickImage({required final bool isFromGallery});
}
