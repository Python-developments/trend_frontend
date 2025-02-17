import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/models/core/base_model.dart';
import 'package:trend/data/models/products/variant_value_key_id_model.dart';

import 'package:trend/core/utils/global.dart';

part 'cart_product_model.g.dart';

@JsonSerializable()
class CartProductModel extends BaseModel {
  @JsonKey(name: 'sellingPrice',
      defaultValue:Global.generateDefaultValue ? 10000.00:null)
  final double originalPrice;
  @JsonKey(defaultValue:Global.generateDefaultValue ? '':null)
  final String name;
  @JsonKey(name: 'mainImage')
  final String? imageUrl;
  @JsonKey(name: 'slashPrice')
  final double? discountPrice;
  @JsonKey(name: 'subTitle')
  final String? subtitle;
  @JsonKey(defaultValue:Global.generateDefaultValue ? ProductStockStatus.outOfStock:null)
  final ProductStockStatus stockStatus;
  @JsonKey(name: 'attributes',defaultValue:Global.generateDefaultValue ? []:null)
  final List<VariantValueKeyIdModel> productVariants;

  factory CartProductModel.fromJson(final Map<String, dynamic> data) =>
      _$CartProductModelFromJson(data);
  CartProductModel(
      {required super.id,
      required this.originalPrice,
      required this.subtitle,
      required this.stockStatus,
      required this.name,
      required this.imageUrl,
      required this.discountPrice,
      required this.productVariants});

  Map<String, dynamic> toJson() => _$CartProductModelToJson(this);
  @override
  bool operator ==(covariant final CartProductModel other) {
    return id == other.id &&
        originalPrice == other.originalPrice &&
        stockStatus == other.stockStatus;
  }

  factory CartProductModel.empty() {
    return CartProductModel(
      id: '',
      originalPrice: 0.0,
      name: 'name',
      imageUrl: 'imageUrl',
      discountPrice: 0.0,
      subtitle: 'subtitle',
      stockStatus: ProductStockStatus.inStock,
      productVariants: [VariantValueKeyIdModel.empty()],
    );
  }
}
