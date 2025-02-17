import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/models/category_model.dart';
import 'package:trend/data/models/core/base_model.dart';
import 'package:trend/data/models/products/product_details_item_model.dart';
import 'package:trend/data/models/products/product_model.dart';
import 'package:trend/data/models/vendors/short_vendor_model.dart';
import 'package:trend/data/models/products/variant_key_values_model.dart';

import 'package:trend/core/utils/global.dart';

part 'product_details_model.g.dart';

@JsonSerializable()
class ProductDetailsModel extends BaseModel {
  @JsonKey(defaultValue:Global.generateDefaultValue ? '':null)
  final String name, description, slug;
  @JsonKey(name: 'shop')
  final ShortVendorModel vendor;

  @JsonKey(defaultValue:Global.generateDefaultValue ? false:null)
  final bool isCustomizable, isFavorite;
  @JsonKey(name: 'COD',defaultValue:Global.generateDefaultValue ? false:null)
  final bool allowCashOnDelivery;
  @JsonKey(defaultValue:Global.generateDefaultValue ? 0:null)
  final int preparationTimeValue;
  @JsonKey(defaultValue:Global.generateDefaultValue ? ProductPreparationTimeUnit.minutes:null)
  final ProductPreparationTimeUnit preparationTimeUnit;
  final String? brand, subtitle;
  @JsonKey(name: 'attributesList',defaultValue:Global.generateDefaultValue ?[]:null)
  final List<VariantKeyValuesModel> productVariants;
  @JsonKey(defaultValue:Global.generateDefaultValue ?[]:null)
  final List<ProductDetailsItemModel> productItems;
  final CategoryModel mainCategory;

  ProductDetailsModel({
    required super.id,
    required this.name,
    required this.slug,
    required this.description,
    required this.vendor,
    required this.isFavorite,
    required this.isCustomizable,
    required this.allowCashOnDelivery,
    required this.preparationTimeValue,
    required this.subtitle,
    required this.preparationTimeUnit,
    required this.brand,
    required this.productVariants,
    required this.productItems,
    required this.mainCategory,
  });

  factory ProductDetailsModel.fromJson(final Map<String, dynamic> data) =>
      _$ProductDetailsModelFromJson(data);

  ProductDetailsItemModel? getSelectedDetailsItem(
      final List<String> selectedVariants) {
    final List<ProductDetailsItemModel> matched =
        productItems.where((final item) {
      return item.variantValues.every(
          (final variant) => selectedVariants.contains(variant.valueName));
    }).toList();
    return matched.firstOrNull;
  }

  //keyIndex of list with multiple variants , any single values are excluded
  List<String> getVariantValues(
      final int keyIndex, final List<String> selectedVariants) {
    final Set<String> result =
        productItems.fold({}, (final previousValue, final item) {
      // if the product is already mismatch to the selected variants .. dont include it
      // to prevent ordering unavailable combination of variants
      bool canTakeThisItem = true;
      for (int i = 0; i < keyIndex; i++) {
        final String currentItemVariantValue = item.variantValues[i].valueName;
        if (selectedVariants[i] != currentItemVariantValue) {
          canTakeThisItem = false;
        }
      }
      return canTakeThisItem
          ? (previousValue..add(item.variantValues[keyIndex].valueName))
          : previousValue;
    });
    return result.toList();
  }

  String get nonHtmlDescription =>description.replaceAllMapped(
        RegExp(r'<[^>]*> *', multiLine: true),
        (final match) => match.group(0) == '<br>' ? '\n' : '',
      ).replaceAll('\n\n' , '');

  ProductModel toProductModel() => ProductModel(
        stockStatus: ProductStockStatus.inStock,
        initialItemIndex: 0,
        id: id,
        name: name,
        imageUrl: productItems.first.images.first,
        discountPrice: productItems.first.slashPrice,
        originalPrice: productItems.first.sellingPrice,
        subtitle: subtitle,
      );

  Map<String,dynamic> toJson() => _$ProductDetailsModelToJson(this);

  factory ProductDetailsModel.empty() => ProductDetailsModel(
        id: 'id',
        name: 'name',
        slug: 'slug',
        description: 'description',
        vendor: ShortVendorModel.empty(),
        isFavorite: false,
        isCustomizable: false,
        allowCashOnDelivery: false,
        preparationTimeValue: 0,
        subtitle: 'subtitle',
        preparationTimeUnit: ProductPreparationTimeUnit.hours,
        brand: 'brand',
        productVariants: [],
        productItems: [],
        mainCategory: CategoryModel.empty(),
      );
}
