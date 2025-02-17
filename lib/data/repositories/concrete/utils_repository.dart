import 'dart:async';

import 'package:dio/dio.dart';
import 'package:http_parser/http_parser.dart';
import 'package:injectable/injectable.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/dtos/file_dto.dart';
import 'package:trend/data/models/category_model.dart';
import 'package:trend/data/models/core/app_settings_model.dart';
import 'package:trend/data/models/core/app_translation_model.dart';
import 'package:trend/data/repositories/abstract/i_utils_repository.dart';


@Singleton(as: IUtilsRepository)
class UtilsRepository extends IUtilsRepository {
  UtilsRepository(super.appFlavor,super.httpClient, super.appDatabase, super.logger,
      super.currentLocationController);

  @override
  Future<List<CategoryModel>> getCategories() =>getList<CategoryModel>(
  url: 'store/categories',
  parameters: {},
  needLocation: true,
  mapper: CategoryModel.fromJson);
  @override
  Future<AppSettingsModel> getAppSettings() async => getObject(
  url: 'store/settings',
  needLocation: false,
  mapper: (final data) => AppSettingsModel.fromJson(data));

  @override
  Future<AppTranslationModel> getLanguageTranslation(
          {required final String languageCode}) async =>
      getObject(
          url: 'store/translations',
          needLocation: false,
          parameters: {'acceptLanguage': languageCode},
          mapper: (final data) => AppTranslationModel(
              translation: data.map(
                  (final key, final value) => MapEntry(key, value as String))));

  @override
  Future<String> getStaticPage({required final StaticPageType type}) =>
      getObject(
          url: 'store/pages/${type.name}',
          needLocation: false,
          mapper: (final data) => data['content']);
  @override
  Future<String> uploadMedia({required final FileDto fileDto}) async => post(
      url: 'files/upload',
      needLocation: false,
      parameters: {
        'mediaType': 'Normal',
        'file': MultipartFile.fromBytes(fileDto.fileBytes,
            filename: fileDto.fileName,
            contentType: MediaType('image', fileDto.fileName.split('.').last)),
      },
      mapper: (final data) => data['_id'],
      isFormData: true);
}
