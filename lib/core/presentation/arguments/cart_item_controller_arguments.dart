import 'package:trend/data/models/cart/cart_item_model.dart';

class CartItemControllerArguments {
  final CartItemModel cartItem;
  final String cartId;

  CartItemControllerArguments({required this.cartItem, required this.cartId});
}
