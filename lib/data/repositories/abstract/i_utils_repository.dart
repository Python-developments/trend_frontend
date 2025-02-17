import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/dtos/file_dto.dart';
import 'package:trend/data/models/category_model.dart';
import 'package:trend/data/models/core/app_settings_model.dart';
import 'package:trend/data/models/core/app_translation_model.dart';
import 'package:trend/data/repositories/abstract/i_repository_impl.dart';

abstract class IUtilsRepository extends IRepositoryImpl {
  IUtilsRepository(super.appFlavor,super.httpClient, super.appDatabase, super.logger,
      super.currentLocationController);

  Future<List<CategoryModel>> getCategories();
  Future<AppSettingsModel> getAppSettings();
  Future<AppTranslationModel> getLanguageTranslation(
      {required final String languageCode});
  Future<String> uploadMedia({required final FileDto fileDto});
  Future<String> getStaticPage({required final StaticPageType type});
}
