import 'package:trend/data/dtos/products_filter_dto.dart';

class VendorFilteredProductsControllerArguments {
  final String vendorId;
  final String? searchString;
  final ProductsFilterDto? filter;

  VendorFilteredProductsControllerArguments(
      {required this.vendorId,
      required this.searchString,
      required this.filter});
}
