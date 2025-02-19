// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bottom_navigator_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BottomNavigatorController on BottomNavigatorControllerBase, Store {
  late final _$currentIndexAtom = Atom(
      name: 'BottomNavigatorControllerBase.currentIndex', context: context);

  @override
  int get currentIndex {
    _$currentIndexAtom.reportRead();
    return super.currentIndex;
  }

  bool _currentIndexIsInitialized = false;

  @override
  set currentIndex(int value) {
    _$currentIndexAtom.reportWrite(
        value, _currentIndexIsInitialized ? super.currentIndex : null, () {
      super.currentIndex = value;
      _currentIndexIsInitialized = true;
    });
  }

  late final _$BottomNavigatorControllerBaseActionController =
      ActionController(name: 'BottomNavigatorControllerBase', context: context);

  @override
  void changeIndex(int newIndex) {
    final _$actionInfo = _$BottomNavigatorControllerBaseActionController
        .startAction(name: 'BottomNavigatorControllerBase.changeIndex');
    try {
      return super.changeIndex(newIndex);
    } finally {
      _$BottomNavigatorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentIndex: ${currentIndex}
    ''';
  }
}
