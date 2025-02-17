// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'cart_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CartController on CartControllerBase, Store {
  late final _$orderSummaryAtom =
      Atom(name: 'CartControllerBase.orderSummary', context: context);

  @override
  OrderSummaryModel? get orderSummary {
    _$orderSummaryAtom.reportRead();
    return super.orderSummary;
  }

  @override
  set orderSummary(OrderSummaryModel? value) {
    _$orderSummaryAtom.reportWrite(value, super.orderSummary, () {
      super.orderSummary = value;
    });
  }

  late final _$orderCardMessageAtom =
      Atom(name: 'CartControllerBase.orderCardMessage', context: context);

  @override
  String? get orderCardMessage {
    _$orderCardMessageAtom.reportRead();
    return super.orderCardMessage;
  }

  @override
  set orderCardMessage(String? value) {
    _$orderCardMessageAtom.reportWrite(value, super.orderCardMessage, () {
      super.orderCardMessage = value;
    });
  }

  late final _$couponStateAtom =
      Atom(name: 'CartControllerBase.couponState', context: context);

  @override
  CouponState get couponState {
    _$couponStateAtom.reportRead();
    return super.couponState;
  }

  @override
  set couponState(CouponState value) {
    _$couponStateAtom.reportWrite(value, super.couponState, () {
      super.couponState = value;
    });
  }

  late final _$cartIdAtom =
      Atom(name: 'CartControllerBase.cartId', context: context);

  @override
  String? get cartId {
    _$cartIdAtom.reportRead();
    return super.cartId;
  }

  @override
  set cartId(String? value) {
    _$cartIdAtom.reportWrite(value, super.cartId, () {
      super.cartId = value;
    });
  }

  late final _$cartItemsAtom =
      Atom(name: 'CartControllerBase.cartItems', context: context);

  @override
  ObservableList<CartItemModel> get cartItems {
    _$cartItemsAtom.reportRead();
    return super.cartItems;
  }

  @override
  set cartItems(ObservableList<CartItemModel> value) {
    _$cartItemsAtom.reportWrite(value, super.cartItems, () {
      super.cartItems = value;
    });
  }

  late final _$addProductToCartAsyncAction =
      AsyncAction('CartControllerBase.addProductToCart', context: context);

  @override
  Future<void> addProductToCart(
      {required CartItemDto cartItemDto, required String productName}) {
    return _$addProductToCartAsyncAction.run(() => super
        .addProductToCart(cartItemDto: cartItemDto, productName: productName));
  }

  late final _$updateItemDetailsAsyncAction =
      AsyncAction('CartControllerBase.updateItemDetails', context: context);

  @override
  Future<void> updateItemDetails(
      {required CartItemDto cartItemDto,
      required String cartItemId,
      required String productName}) {
    return _$updateItemDetailsAsyncAction.run(() => super.updateItemDetails(
        cartItemDto: cartItemDto,
        cartItemId: cartItemId,
        productName: productName));
  }

  late final _$updateItemQuantityAsyncAction =
      AsyncAction('CartControllerBase.updateItemQuantity', context: context);

  @override
  Future<void> updateItemQuantity(
      {required String itemId, required int quantity}) {
    return _$updateItemQuantityAsyncAction.run(
        () => super.updateItemQuantity(itemId: itemId, quantity: quantity));
  }

  late final _$CartControllerBaseActionController =
      ActionController(name: 'CartControllerBase', context: context);

  @override
  Future<void> getOrderSummary({CartModel? currentModel}) {
    final _$actionInfo = _$CartControllerBaseActionController.startAction(
        name: 'CartControllerBase.getOrderSummary');
    try {
      return super.getOrderSummary(currentModel: currentModel);
    } finally {
      _$CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void applyCoupon() {
    final _$actionInfo = _$CartControllerBaseActionController.startAction(
        name: 'CartControllerBase.applyCoupon');
    try {
      return super.applyCoupon();
    } finally {
      _$CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> deleteItem({required String cartItemId}) {
    final _$actionInfo = _$CartControllerBaseActionController.startAction(
        name: 'CartControllerBase.deleteItem');
    try {
      return super.deleteItem(cartItemId: cartItemId);
    } finally {
      _$CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void emptyCart({required bool needToDiscardCart}) {
    final _$actionInfo = _$CartControllerBaseActionController.startAction(
        name: 'CartControllerBase.emptyCart');
    try {
      return super.emptyCart(needToDiscardCart: needToDiscardCart);
    } finally {
      _$CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void removeCoupon() {
    final _$actionInfo = _$CartControllerBaseActionController.startAction(
        name: 'CartControllerBase.removeCoupon');
    try {
      return super.removeCoupon();
    } finally {
      _$CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void submitOrderCardMessage() {
    final _$actionInfo = _$CartControllerBaseActionController.startAction(
        name: 'CartControllerBase.submitOrderCardMessage');
    try {
      return super.submitOrderCardMessage();
    } finally {
      _$CartControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
orderSummary: ${orderSummary},
orderCardMessage: ${orderCardMessage},
couponState: ${couponState},
cartId: ${cartId},
cartItems: ${cartItems}
    ''';
  }
}
