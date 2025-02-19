import 'dart:async';

import 'package:image_picker/image_picker.dart';
import 'package:injectable/injectable.dart';
import 'package:trend/data/dtos/file_dto.dart';

import 'package:trend/third_parties_modules/abstract/i_image_picking_module.dart';
import 'package:trend/third_parties_modules/abstract/i_permissions_handler_module.dart';

import 'package:trend/third_parties_modules/abstract/i_crop_image_module.dart';

@Singleton(as: IImagePickingModule)
class ImagePickingModule extends IImagePickingModule {
  final IPermissionsHandlerModule permissionsHandlerModule;
  final ICropImageModule cropImageModule;
  final ImagePicker _picker = ImagePicker();

  ImagePickingModule(this.permissionsHandlerModule, this.cropImageModule);

  @override
  Future<FileDto?> pickImage({required final bool isFromGallery, required final bool withCrop}) async {
    final bool hasGrantPermissions =
        isFromGallery ? await permissionsHandlerModule.hasGrantPhotosPermission() : await permissionsHandlerModule.hasGrantCameraPermission();

    if (!hasGrantPermissions) {
      return null;
    }

    final XFile? selectedImage =
        await _picker.pickImage(source: isFromGallery ? ImageSource.gallery : ImageSource.camera, requestFullMetadata: false);
    if (selectedImage != null) {
      FileDto? fileDto = FileDto(filePath: selectedImage.path, fileBytes: await selectedImage.readAsBytes(), fileName: selectedImage.name);
      if (withCrop) {
        fileDto = await cropImageModule.cropImage(pickedFile: fileDto);
      }
      return fileDto;
    } else {
      return null;
    }
  }
}
