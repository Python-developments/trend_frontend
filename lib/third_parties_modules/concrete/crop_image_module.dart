import 'dart:async';

import 'package:image_cropper/image_cropper.dart';
import 'package:injectable/injectable.dart';
import 'package:trend/core/presentation/app_style.dart';
import 'package:trend/data/dtos/file_dto.dart';

import 'package:trend/third_parties_modules/abstract/i_crop_image_module.dart';

@Singleton(as: ICropImageModule)
class CropImageModule extends ICropImageModule {
  @override
  Future<FileDto?> cropImage({required final FileDto pickedFile}) async {
    final CroppedFile? selectedImage = await ImageCropper().cropImage(
      sourcePath: pickedFile.filePath,
      aspectRatio: const CropAspectRatio(ratioX: 4, ratioY: 4),
      uiSettings: [
        AndroidUiSettings(
          toolbarTitle: 'Trend',
          toolbarColor: AppStyle.blue,
          toolbarWidgetColor: AppStyle.white,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
        ),
        IOSUiSettings(
          title: 'Trend',
          minimumAspectRatio: 1.0,
          aspectRatioPresets: [
            CropAspectRatioPreset.square,
          ],
        ),
        // WebUiSettings(
        //   context: context,
        // ),
      ],
    );
    return selectedImage != null
        ? FileDto(fileName: pickedFile.fileName, filePath: selectedImage.path, fileBytes: await selectedImage.readAsBytes())
        : null;
  }
}
