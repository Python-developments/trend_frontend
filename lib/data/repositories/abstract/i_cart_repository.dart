import 'package:trend/data/dtos/cart_item_dto.dart';
import 'package:trend/data/models/cart/cart_model.dart';
import 'package:trend/data/repositories/abstract/i_repository_impl.dart';

abstract class ICartRepository extends IRepositoryImpl {
  ICartRepository(super.appFlavor,super.httpClient, super.appDatabase, super.logger,
      super.currentLocationController);

  Future<CartModel> getCart({required final String? cartId});
  Future<String> getCartId();
  Future<String> addProductToCart(
      {required final CartItemDto cartItemDto, required final String? cartId});
  Future<void> updateItemDetails(
      {required final CartItemDto cartItemDto,
      required final String cartItemId,
      required final String cartId});
  Future<void> clearCart({required final String cartId});
  Future<void> updateQuantity(
      {required final String cartItemId,
      required final int newQuantity,
      required final String cartId});
}
