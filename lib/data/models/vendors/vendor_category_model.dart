import 'package:json_annotation/json_annotation.dart';

import 'package:trend/core/utils/global.dart';

part 'vendor_category_model.g.dart';

@JsonSerializable()
class VendorCategoryModel {

  final String id;
  @JsonKey(defaultValue:Global.generateDefaultValue ? 'Category':null)
  final String  name;
  @JsonKey(name: 'productsInCategory',defaultValue:Global.generateDefaultValue ? 0:null)
  final int productsCount;
  VendorCategoryModel({
    required this.id,
    required this.name,
    required this.productsCount,
  });

  factory VendorCategoryModel.fromJson(final Map<String, dynamic> data) =>
      _$VendorCategoryModelFromJson(data);

  Map<String, dynamic> toJson() => _$VendorCategoryModelToJson(this);

  factory VendorCategoryModel.empty() =>
      VendorCategoryModel(id: '', name: 'name', productsCount: 3);
}
