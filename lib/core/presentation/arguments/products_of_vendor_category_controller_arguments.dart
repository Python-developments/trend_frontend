class ProductsOfVendorCategoryControllerArguments {
  final String vendorId, categoryId;
  final String? searchString;

  ProductsOfVendorCategoryControllerArguments(
      {required this.vendorId,
      required this.categoryId,
      required this.searchString});
}
