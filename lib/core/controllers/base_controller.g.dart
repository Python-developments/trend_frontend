// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'base_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BaseController on BaseControllerBase, Store {
  Computed<bool>? _$hasDataComputed;

  @override
  bool get hasData => (_$hasDataComputed ??= Computed<bool>(() => super.hasData,
          name: 'BaseControllerBase.hasData'))
      .value;

  late final _$errorAtom =
      Atom(name: 'BaseControllerBase.error', context: context);

  @override
  CustomError? get error {
    _$errorAtom.reportRead();
    return super.error;
  }

  @override
  set error(CustomError? value) {
    _$errorAtom.reportWrite(value, super.error, () {
      super.error = value;
    });
  }

  late final _$isLoadingAtom =
      Atom(name: 'BaseControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$onInitAsyncAction =
      AsyncAction('BaseControllerBase.onInit', context: context);

  @override
  Future<void> onInit() {
    return _$onInitAsyncAction.run(() => super.onInit());
  }

  late final _$runStorePrimaryFunctionAsyncAction = AsyncAction(
      'BaseControllerBase.runStorePrimaryFunction',
      context: context);

  @override
  Future<bool> runStorePrimaryFunction(Future<void> Function() function,
      {void Function(Object)? onCatchError}) {
    return _$runStorePrimaryFunctionAsyncAction.run(() =>
        super.runStorePrimaryFunction(function, onCatchError: onCatchError));
  }

  late final _$runStoreSecondaryFunctionAsyncAction = AsyncAction(
      'BaseControllerBase.runStoreSecondaryFunction',
      context: context);

  @override
  Future<bool> runStoreSecondaryFunction(Future<void> Function() function,
      {void Function(Object)? onCatchError}) {
    return _$runStoreSecondaryFunctionAsyncAction.run(() =>
        super.runStoreSecondaryFunction(function, onCatchError: onCatchError));
  }

  late final _$BaseControllerBaseActionController =
      ActionController(name: 'BaseControllerBase', context: context);

  @override
  void dispose() {
    final _$actionInfo = _$BaseControllerBaseActionController.startAction(
        name: 'BaseControllerBase.dispose');
    try {
      return super.dispose();
    } finally {
      _$BaseControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
error: ${error},
isLoading: ${isLoading},
hasData: ${hasData}
    ''';
  }
}
