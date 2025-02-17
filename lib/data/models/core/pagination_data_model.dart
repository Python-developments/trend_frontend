import 'package:trend/data/models/core/pagination_response_model.dart';

class PaginationDataModel<T> {
  final List<T> items;
  final int totalItems;

  PaginationDataModel({required this.items, required this.totalItems});
  factory PaginationDataModel.fromPaginationResponse(
      final PaginationResponseModel response,
      final T Function(Map<String, dynamic>) mapper) {
    return PaginationDataModel(
        items: response.items.map((final e) => mapper(e)).toList(),
        totalItems: response.totalItems);
  }

  factory PaginationDataModel.empty(final T empty) => PaginationDataModel(
      items: List.generate(5, (final _) => empty), totalItems: 100);
}
