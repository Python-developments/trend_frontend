import 'package:easy_localization/easy_localization.dart' as easy;
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:trend/core/controllers/base_controller.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/core/utils/extensions.dart';
import 'package:trend/data/models/core/app_translation_model.dart';
import 'package:trend/data/repositories/abstract/i_utils_repository.dart';


part 'localization_controller.g.dart';

@singleton
class LocalizationController extends LocalizationControllerBase
    with _$LocalizationController {
  LocalizationController(super.utilsRepository, super.logger,super.appRouter,super.snakeBarShower);
}

abstract class LocalizationControllerBase extends BaseController with Store {
  final IUtilsRepository utilsRepository;

  LocalizationControllerBase(this.utilsRepository, super.logger,super.appRouter,super.snakeBarShower);

  @override
  bool get isLazyController => true;

  @override
  Future<void> loadData() {
      try {
        currentLocale= SupportedLanguage.values.firstWhere((final language) =>
        language.languageCode ==
            (easy.EasyLocalization.of(appRouter.currentContext)?.locale ??
                const Locale('en'))
                .languageCode);
      } catch (_) {
        currentLocale= SupportedLanguage.english;
      }
    return Future.wait(SupportedLanguage.values.map(
        (final language) => utilsRepository
            .getLanguageTranslation(languageCode: language.languageCode)
            .then((final translation) => translations[language] = translation),
      ));
  }
  @observable
  ObservableMap<SupportedLanguage, AppTranslationModel> translations =
      ObservableMap();

  @observable
  SupportedLanguage currentLocale=SupportedLanguage.english;

  @computed
  bool get isRtlLanguage => currentLocale.isRtlLanguage;

  void changeLanguage(final String newLanguageCode) {
    currentLocale=SupportedLanguage.values.firstWhere((final language) =>language.languageCode==newLanguageCode);
    easy.EasyLocalization.of(appRouter.currentContext)!
          .setLocale(Locale(newLanguageCode));
  }

  String translate(final String source, [final List<String>? arguments]) =>
      translations[currentLocale]?.translate(source, arguments) ?? source;




}
