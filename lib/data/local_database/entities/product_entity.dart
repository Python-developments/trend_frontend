import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/local_database/databases/concrete/app_local_database.dart';
import 'package:trend/data/models/products/product_model.dart';

class ProductEntity {
  final String id;
  final String name;
  final String? imageUrl;
  final double originalPrice;
  final double? discountPrice;
  final String? subtitle;
  final ProductsCacheType productCacheType;
  ProductEntity(
      {required this.id,
      required this.name,
      required this.originalPrice,
      required this.productCacheType,
      this.imageUrl,
      this.discountPrice,
      this.subtitle});

  factory ProductEntity.fromLocalProduct(final Product product) =>
      ProductEntity(
          id: product.id,
          name: product.name,
          originalPrice: product.originalPrice,
          productCacheType: product.productCacheType,
          discountPrice: product.discountPrice,
          subtitle: product.subtitle,
          imageUrl: product.imageUrl);
  factory ProductEntity.fromProductModel(
          final ProductModel product, final ProductsCacheType cacheType) =>
      ProductEntity(
          id: product.id,
          name: product.name,
          originalPrice: product.originalPrice,
          discountPrice: product.discountPrice,
          imageUrl: product.imageUrl,
          productCacheType: cacheType);
  Product toLocalProduct() => Product(
      id: id,
      name: name,
      originalPrice: originalPrice,
      productCacheType: productCacheType,
      subtitle: subtitle,
      discountPrice: discountPrice,
      imageUrl: imageUrl);

  ProductModel toProductModel() => ProductModel(
      id: id,
      initialItemIndex: 0,
      originalPrice: originalPrice,
      subtitle: subtitle,
      stockStatus: ProductStockStatus.inStock,
      name: name,
      discountPrice: discountPrice,
      imageUrl: imageUrl);
}
