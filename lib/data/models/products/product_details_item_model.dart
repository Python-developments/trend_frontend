import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/core/utils/global.dart';
import 'package:trend/data/models/products/variant_value_key_id_model.dart';

part 'product_details_item_model.g.dart';

@JsonSerializable()
class ProductDetailsItemModel {
  @JsonKey(name: 'pId')
  final String variantId;
  @JsonKey(name: 'attributes',defaultValue:Global.generateDefaultValue ? []:null)
  final List<VariantValueKeyIdModel> variantValues;
  final double? slashPrice;
  @JsonKey(defaultValue:Global.generateDefaultValue ? 10000.00:null)
  final double sellingPrice;
  @JsonKey(defaultValue:Global.generateDefaultValue ? []:null)
  final List<String> images;
  @JsonKey(name: 'sku')
  final String? skuNumber;
  final String? itemDescription;
  @JsonKey(defaultValue:Global.generateDefaultValue ? ProductStockStatus.outOfStock:null)
  final ProductStockStatus stockStatus;

  ProductDetailsItemModel({
    required this.variantValues,
    required this.sellingPrice,
    required this.variantId,
    required this.stockStatus,
    required this.itemDescription,
    required this.slashPrice,
    required this.images,
    required this.skuNumber,
  });
  factory ProductDetailsItemModel.fromJson(final Map<String, dynamic> data) =>
      _$ProductDetailsItemModelFromJson(data);
  Map<String, dynamic> toJson() => _$ProductDetailsItemModelToJson(this);
}
