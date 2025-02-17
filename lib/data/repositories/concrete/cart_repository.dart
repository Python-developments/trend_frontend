import 'package:injectable/injectable.dart';
import 'package:trend/data/dtos/cart_item_dto.dart';
import 'package:trend/data/models/cart/cart_model.dart';
import 'package:trend/data/repositories/abstract/i_cart_repository.dart';
import 'package:trend/data/repositories/abstract/i_repository_impl.dart';
import 'package:trend/data/repositories/abstract/i_utils_repository.dart';

@Singleton(as: ICartRepository)
class CartRepository extends ICartRepository {
  final IUtilsRepository utilsRepository;
  CartRepository(this.utilsRepository, super.appFlavor,super.httpClient, super.appDatabase,
      super.logger, super.currentLocationController);

  @override
  Future<String> addProductToCart(
          {required final CartItemDto cartItemDto,
          required final String? cartId}) =>
      post(
          url: 'store/cart/items',
          needLocation: true,
          parameters: {
            ...cartItemDto.toJson(),
            'cartId': cartId,
          },
          mapper: (final data) => data['_id']);

  @override
  Future<void> updateItemDetails(
          {required final CartItemDto cartItemDto,
          required final String cartItemId,
          required final String cartId}) =>
      put(
          url: 'store/cart/$cartId/items',
          needLocation: true,
          parameters: {
            'cartItemId': cartItemId,
            ...cartItemDto.toJson(),
          },
          mapper: emptyMapper);
  @override
  Future<void> clearCart({required final String cartId}) =>
      delete(url: 'store/cart/$cartId', needLocation: false);
  @override
  Future<CartModel> getCart({required final String? cartId}) => getObject(
      url: 'store/cart/$cartId',
      mapper: CartModel.fromJson,
      needLocation: true);

  @override
  Future<String> getCartId() async {
    final CartModel userCart = await getObject(
        url: 'store/cart/myCart',
        mapper: CartModel.fromJson,
        needLocation: true);
    return userCart.id;
  }

  @override
  Future<void> updateQuantity(
          {required final String cartItemId,
          required final int newQuantity,
          required final String cartId}) =>
      put(
          url: 'store/cart/$cartId/items',
          parameters: {
            'cartItemId': cartItemId,
            'quantity': newQuantity,
          },
          mapper: emptyMapper,
          needLocation: true);
}
