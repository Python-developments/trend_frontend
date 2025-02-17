// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AppController on AppControllerBase, Store {
  late final _$isHuaweiDeviceAtom =
      Atom(name: 'AppControllerBase.isHuaweiDevice', context: context);

  @override
  bool get isHuaweiDevice {
    _$isHuaweiDeviceAtom.reportRead();
    return super.isHuaweiDevice;
  }

  @override
  set isHuaweiDevice(bool value) {
    _$isHuaweiDeviceAtom.reportWrite(value, super.isHuaweiDevice, () {
      super.isHuaweiDevice = value;
    });
  }

  late final _$AppControllerBaseActionController =
      ActionController(name: 'AppControllerBase', context: context);

  @override
  Future<void> loadData() {
    final _$actionInfo = _$AppControllerBaseActionController.startAction(
        name: 'AppControllerBase.loadData');
    try {
      return super.loadData();
    } finally {
      _$AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> changeAppLanguage(String languageCode) {
    final _$actionInfo = _$AppControllerBaseActionController.startAction(
        name: 'AppControllerBase.changeAppLanguage');
    try {
      return super.changeAppLanguage(languageCode);
    } finally {
      _$AppControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isHuaweiDevice: ${isHuaweiDevice}
    ''';
  }
}
