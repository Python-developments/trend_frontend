import 'package:trend/core/utils/enums.dart';

class FilteringResultPageArguments {
  final double? minPrice, maxPrice;
  final ProductsSortType? sortType;

  FilteringResultPageArguments(
      {required this.minPrice, required this.maxPrice, required this.sortType});
}
