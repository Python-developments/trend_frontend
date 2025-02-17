import 'package:trend/data/models/cart/cart_item_model.dart';

class ProductDetailsPageArguments {
  final String productId;
  final String? defaultImage, heroTag;
  final CartItemModel? cartItem;
  final void Function()? productsPageRefresher;
  final int initialItemIndex;
  final bool isFromDeepLink;
  ProductDetailsPageArguments(
      {required this.productId,
      required this.defaultImage,
      required this.initialItemIndex,
      required this.productsPageRefresher,
      this.isFromDeepLink = false,
      this.cartItem,
      this.heroTag});
}
