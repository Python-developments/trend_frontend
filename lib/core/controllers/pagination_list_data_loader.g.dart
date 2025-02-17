// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_list_data_loader.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PaginationListDataLoader<T> on PaginationListDataLoaderBase<T>, Store {
  late final _$isLoadingMoreDataAtom = Atom(
      name: 'PaginationListDataLoaderBase.isLoadingMoreData', context: context);

  @override
  bool get isLoadingMoreData {
    _$isLoadingMoreDataAtom.reportRead();
    return super.isLoadingMoreData;
  }

  @override
  set isLoadingMoreData(bool value) {
    _$isLoadingMoreDataAtom.reportWrite(value, super.isLoadingMoreData, () {
      super.isLoadingMoreData = value;
    });
  }

  late final _$canLoadMoreDataAtom = Atom(
      name: 'PaginationListDataLoaderBase.canLoadMoreData', context: context);

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

  late final _$PaginationListDataLoaderBaseActionController =
      ActionController(name: 'PaginationListDataLoaderBase', context: context);

  @override
  Future<void> loadData() {
    final _$actionInfo = _$PaginationListDataLoaderBaseActionController
        .startAction(name: 'PaginationListDataLoaderBase.loadData');
    try {
      return super.loadData();
    } finally {
      _$PaginationListDataLoaderBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> loadNextPage() {
    final _$actionInfo = _$PaginationListDataLoaderBaseActionController
        .startAction(name: 'PaginationListDataLoaderBase.loadNextPage');
    try {
      return super.loadNextPage();
    } finally {
      _$PaginationListDataLoaderBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoadingMoreData: ${isLoadingMoreData},
canLoadMoreData: ${canLoadMoreData}
    ''';
  }
}
