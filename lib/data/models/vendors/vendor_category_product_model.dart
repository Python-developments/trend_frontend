import 'package:json_annotation/json_annotation.dart';
import 'package:trend/data/models/products/product_model.dart';

part 'vendor_category_product_model.g.dart';

@JsonSerializable()
class VendorCategoryProductModel {
  final String categoryId;
  final ProductModel product;
  VendorCategoryProductModel({
    required this.categoryId,
    required this.product,
  });

  factory VendorCategoryProductModel.fromJson(
          final Map<String, dynamic> data) =>
      _$VendorCategoryProductModelFromJson(data);


}
