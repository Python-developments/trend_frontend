// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'continuously_pagination_list_data_loader.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContinuouslyPaginationListDataLoader<T>
    on ContinuouslyPaginationListDataLoaderBase<T>, Store {
  late final _$canLoadMoreDataAtom = Atom(
      name: 'ContinuouslyPaginationListDataLoaderBase.canLoadMoreData',
      context: context);

  @override
  bool get canLoadMoreData {
    _$canLoadMoreDataAtom.reportRead();
    return super.canLoadMoreData;
  }

  @override
  set canLoadMoreData(bool value) {
    _$canLoadMoreDataAtom.reportWrite(value, super.canLoadMoreData, () {
      super.canLoadMoreData = value;
    });
  }

  late final _$ContinuouslyPaginationListDataLoaderBaseActionController =
      ActionController(
          name: 'ContinuouslyPaginationListDataLoaderBase', context: context);

  @override
  Future<void> loadData() {
    final _$actionInfo =
        _$ContinuouslyPaginationListDataLoaderBaseActionController.startAction(
            name: 'ContinuouslyPaginationListDataLoaderBase.loadData');
    try {
      return super.loadData();
    } finally {
      _$ContinuouslyPaginationListDataLoaderBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void _loadNextPage() {
    final _$actionInfo =
        _$ContinuouslyPaginationListDataLoaderBaseActionController.startAction(
            name: 'ContinuouslyPaginationListDataLoaderBase._loadNextPage');
    try {
      return super._loadNextPage();
    } finally {
      _$ContinuouslyPaginationListDataLoaderBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
canLoadMoreData: ${canLoadMoreData}
    ''';
  }
}
