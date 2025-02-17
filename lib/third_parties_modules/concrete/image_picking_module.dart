import 'dart:async';
import 'dart:io';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';

import 'package:trend/third_parties_modules/abstract/i_image_picking_module.dart';
import 'package:trend/third_parties_modules/abstract/i_permissions_handler_module.dart';

@Singleton(as: IImagePickingModule)
class ImagePickingModule extends IImagePickingModule {
  final IPermissionsHandlerModule permissionsHandlerModule;
  final ImagePicker _picker = ImagePicker();

  ImagePickingModule(this.permissionsHandlerModule);

  @override
  Future<PickedImage?> pickImage({required final bool isFromGallery}) async {


    final bool hasGrantPermissions=Platform.isAndroid?true:
       isFromGallery? await permissionsHandlerModule.hasGrantPhotosPermission()
        :await permissionsHandlerModule.hasGrantCameraPermission();


    if(!hasGrantPermissions) {
      return null;
    }

    final XFile? selectedImage = await _picker.pickImage(
        source: isFromGallery ? ImageSource.gallery : ImageSource.camera);
    return selectedImage == null
        ? null
        : (
            selectedImage.name,
            selectedImage.path,
            await selectedImage.readAsBytes()
          );
  }
}
