// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'localization_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LocalizationController on LocalizationControllerBase, Store {
  Computed<bool>? _$isRtlLanguageComputed;

  @override
  bool get isRtlLanguage =>
      (_$isRtlLanguageComputed ??= Computed<bool>(() => super.isRtlLanguage,
              name: 'LocalizationControllerBase.isRtlLanguage'))
          .value;

  late final _$translationsAtom =
      Atom(name: 'LocalizationControllerBase.translations', context: context);

  @override
  ObservableMap<SupportedLanguage, AppTranslationModel> get translations {
    _$translationsAtom.reportRead();
    return super.translations;
  }

  @override
  set translations(
      ObservableMap<SupportedLanguage, AppTranslationModel> value) {
    _$translationsAtom.reportWrite(value, super.translations, () {
      super.translations = value;
    });
  }

  late final _$currentLocaleAtom =
      Atom(name: 'LocalizationControllerBase.currentLocale', context: context);

  @override
  SupportedLanguage get currentLocale {
    _$currentLocaleAtom.reportRead();
    return super.currentLocale;
  }

  @override
  set currentLocale(SupportedLanguage value) {
    _$currentLocaleAtom.reportWrite(value, super.currentLocale, () {
      super.currentLocale = value;
    });
  }

  @override
  String toString() {
    return '''
translations: ${translations},
currentLocale: ${currentLocale},
isRtlLanguage: ${isRtlLanguage}
    ''';
  }
}
