import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/core/utils/global.dart';
import 'package:trend/data/models/core/base_model.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends BaseModel {
  @JsonKey(name: 'sellingPrice', defaultValue:Global.generateDefaultValue ? 10000.0:null)
  final double originalPrice;

  @JsonKey(defaultValue:Global.generateDefaultValue ? 'Unknown':null)
  final String name;

  @JsonKey(name: 'mainImage')
  final String? imageUrl;

  @JsonKey(name: 'slashPrice')
  final double? discountPrice;

  @JsonKey(name: 'subTitle')
  final String? subtitle;

  @JsonKey(defaultValue: Global.generateDefaultValue ? ProductStockStatus.outOfStock:null)
  final ProductStockStatus stockStatus;

  @JsonKey(name: 'selectedItemIndex' ,
      defaultValue: Global.generateDefaultValue ? 0 : null)
  final int initialItemIndex;

  ProductModel(
      {required super.id,
      required this.originalPrice,
      required this.subtitle,
      required this.stockStatus,
      required this.name,
      required this.imageUrl,
      required this.discountPrice,
      required this.initialItemIndex});

  factory ProductModel.fromJson(final Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductModelToJson(this);

  factory ProductModel.empty([final int? price]) => ProductModel(
      id: 'id',
      originalPrice: price?.toDouble()??25,
      subtitle: 'asdasd',
      stockStatus: ProductStockStatus.inStock,
      initialItemIndex: 0,
      name: 'name',
      imageUrl:
          'https://wowvir-file-storage.s3.me-central-1.amazonaws.com/ed5d44c5-eff1-48eb-b87b-4abf05ad57a72db77d22-177d-4faf-8b95-128cb444a6a4test.thumbnail.png',
      discountPrice: 213);
}
