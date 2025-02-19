import 'package:trend/data/dtos/file_dto.dart';
import 'package:trend/third_parties_modules/abstract/i_module.dart';

abstract class ICropImageModule extends IModule {
  Future<FileDto?> cropImage({required final FileDto pickedFile});
}
