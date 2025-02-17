import 'package:trend/core/utils/enums.dart';

class ProductsFilterDto {
  final ProductsSortType? sort;
  final double? minimumPrice, maximumPrice;
  final List<String> variantsIds;
  ProductsFilterDto(
      {required this.sort,
      required this.variantsIds,
      required this.minimumPrice,
      required this.maximumPrice});

  Map<String, dynamic> toJson() {
    String variantsFilterString = '';
    for (int i = 0; i < variantsIds.length; i++) {
      variantsFilterString =
          '$variantsFilterString${i > 0 ? ',' : ''}${variantsIds[i]}';
    }

    final String? priceFilteringString =
        (minimumPrice != null && maximumPrice != null)
            ? 'gte::$minimumPrice;lte::$maximumPrice'
            : (minimumPrice != null)
                ? 'gte::$minimumPrice'
                : (maximumPrice != null)
                    ? 'lte::$maximumPrice'
                    : null;

    return {
      if (priceFilteringString != null)
        'filter.productItems.@.sellingPrice': priceFilteringString,
      if (variantsFilterString.isNotEmpty)
        'filter.productItems.@.attributes._id': 'in::$variantsFilterString',
      if (sort == ProductsSortType.priceLowestToHighest) ...{
        'sortBy': 'productItems.sellingPrice',
        'sortDirection': 'asc'
      },
      if (sort == ProductsSortType.priceHighestToLowest) ...{
        'sortBy': 'productItems.sellingPrice',
        'sortDirection': 'desc'
      },
      if (sort == ProductsSortType.newestToOldest) ...{
        'sortBy': 'createdAt',
        'sortDirection': 'desc'
      },
    };
  }

  int get filterItemsCount =>
      variantsIds.length +
      (sort != null ? 1 : 0) +
      (minimumPrice != null || maximumPrice != null ? 1 : 0);
      // +(maximumPrice != null ? 1 : 0);
}
