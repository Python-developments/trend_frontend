import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trend/data/models/products/product_model.dart';

import 'package:trend/data/models/vendors/vendor_model.dart';

import 'package:trend/core/utils/global.dart';

part 'vendor_products_search_model.g.dart';

@JsonSerializable()
class VendorProductSearchModel {
  @JsonKey(name: 'shop')
  final VendorModel vendor;
  @JsonKey(defaultValue:Global.generateDefaultValue ?[]:null)
  final List<ProductModel> products;

  VendorProductSearchModel({required this.vendor, required this.products});
  factory VendorProductSearchModel.fromJson(final Map<String, dynamic> data) =>
      _$VendorProductSearchModelFromJson(data);

  factory VendorProductSearchModel.empty() => VendorProductSearchModel(
      vendor: VendorModel.empty(),
      products: List.generate(5, (final _) => ProductModel.empty()));
}
