import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:trend/core/controllers/auth_controller.dart';
import 'package:trend/core/controllers/current_location_controller.dart';
import 'package:trend/core/controllers/object_data_loader.dart';
import 'package:trend/core/presentation/arguments/vendor_products_page_arguments.dart';
import 'package:trend/core/presentation/dialogs/confirmation_dialog.dart';
import 'package:trend/core/presentation/dialogs/show_custom_dialog.dart';
import 'package:trend/core/controllers/controllers_mixins/form_mixin.dart';
import 'package:trend/core/presentation/router/auto_router.dart';
import 'package:trend/core/utils/debouncer.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/dtos/cart_item_dto.dart';
import 'package:trend/data/errors/checkout_errors.dart';
import 'package:trend/data/errors/custom_error.dart';
import 'package:trend/data/errors/empty_items_errors.dart';
import 'package:trend/data/models/cart/cart_item_model.dart';
import 'package:trend/data/models/cart/cart_model.dart';
import 'package:trend/data/models/orders/order_summary_model.dart';
import 'package:trend/data/repositories/abstract/i_cart_repository.dart';
import 'package:trend/data/repositories/abstract/i_checkout_repository.dart';
import 'package:trend/dependencies.dart';

part 'cart_controller.g.dart';

@singleton
class CartController extends CartControllerBase with _$CartController {
  CartController(
    super.currentLocationController,
    super.cartRepository,
    super.checkoutRepository,
    super.logger,super.appRouter,super.snakeBarShower  );
}

abstract class CartControllerBase extends ObjectDataLoader<CartModel>
    with FormMixin, Store {
  final Debouncer debouncer=Debouncer(duration:const Duration(seconds:2));
  final CurrentLocationController currentLocationController;
  final ICartRepository cartRepository;
  final ICheckoutRepository checkoutRepository;

  late ReactionDisposer locationReaction;
  CartControllerBase(
    this.currentLocationController,
    this.cartRepository,
    this.checkoutRepository,
    super.logger,super.appRouter,super.snakeBarShower  ) {
    getFieldTextController('couponCode').addListener(() {
      couponState = CouponState.entering;
      getOrderSummary();
    });
    error = EmptyCartError();

    locationReaction=reaction(
            (final _) =>
        currentLocationController.userApplicationSurfingLocation,
            (final value) {
          loadData();
        });
  }

  @override
  bool get isLazyController => true;
  @override
  (String, void Function())? get errorButton => error is EmptyCartError
      ? (
          'Continue shopping',
          () {
              appRouter.replaceAll([HomeRouteNavigation()]);
            }
        )
      : super.errorButton;

  @override
  Future<CartModel> dataGetter() async {
    final AuthController authController=getIt<AuthController>();
    final CustomError cartError = EmptyCartError();
    cartItems = ObservableList();
    if(cartId==null && authController.isGuestUser)
      {
        error = EmptyCartError();
        throw error!;
      }
    cartId ??= await cartRepository.getCartId();
    final CartModel result = await cartRepository.getCart(cartId: cartId);

    cartId = result.id;
    if (result.items.isEmpty) {
      throw cartError;
    } else {
      await getOrderSummary(currentModel: result);
    }
    cartItems = result.items.asObservable();
    return result;
  }

  @action
  Future<void> addProductToCart(
      {required final CartItemDto cartItemDto,
      required final String productName}) async {
    cartId = await cartRepository.addProductToCart(
        cartItemDto: cartItemDto, cartId: cartId);

    await loadData();
    await logger.logEvent(
        () async => await FirebaseAnalytics.instance.logAddToCart(items: [
              AnalyticsEventItem(
                itemId: cartItemDto.variantId,
                quantity: cartItemDto.quantity,
                itemVariant: cartItemDto.variantId,
                itemName: productName,
              )
            ]));
  }

  @action
  Future<void> updateItemDetails(
      {required final CartItemDto cartItemDto,
      required final String cartItemId,
      required final String productName}) async {
    await cartRepository.updateItemDetails(
        cartItemDto: cartItemDto, cartItemId: cartItemId, cartId: cartId!);
    await dataGetter();
    await logger.logEvent(
        () async => await FirebaseAnalytics.instance.logAddToCart(items: [
              AnalyticsEventItem(
                  itemId: cartItemDto.variantId,
                  quantity: cartItemDto.quantity,
                  itemVariant: cartItemDto.variantId,
                  itemName: productName)
            ]));
  }

  @observable
  OrderSummaryModel? orderSummary;
  @observable
  String? orderCardMessage;
  @observable
  CouponState couponState = CouponState.entering;
  @observable
  String? cartId;

  @observable
  ObservableList<CartItemModel> cartItems = <CartItemModel>[].asObservable();

  @action
  Future<void> updateItemQuantity(
          {required final String itemId, required final int quantity}) async =>
      runStoreSecondaryFunction(() async {
        await cartRepository.updateQuantity(
            cartItemId: itemId, newQuantity: quantity, cartId: cartId!);
        final CartItemModel toReplaceModel =
            cartItems.firstWhere((final element) => element.id == itemId);
        if (quantity > 0) {
          cartItems.insert(cartItems.indexOf(toReplaceModel),
              toReplaceModel.copyWith(quantity: quantity));
          await logger.logEvent(
              () async => await FirebaseAnalytics.instance.logAddToCart(
                    items: [
                      AnalyticsEventItem(
                          itemId: toReplaceModel.product.id,
                          quantity: quantity,
                          itemName: toReplaceModel.product.name)
                    ],
                  ));
        } else {
          await logger.logEvent(() async =>
              await FirebaseAnalytics.instance.logRemoveFromCart(items: [
                AnalyticsEventItem(
                    itemId: toReplaceModel.product.id,
                    itemName: toReplaceModel.product.name,
                    price: toReplaceModel.product.originalPrice)
              ]));
        }
        cartItems.remove(toReplaceModel);
        if (cartItems.isEmpty) {
          final String vendorId = data!.vendorId!;
          emptyCart(needToDiscardCart: false);
          // ignore: unawaited_futures
          appRouter.replace(HomeRouteNavigation());
          await appRouter.push(VendorProductsRoute(
              args: VendorDetailsPageArguments(vendorId: vendorId)));
        } else {
          debouncer.run( ()async=>await getOrderSummary());
        }
      });

  @action
  Future<void> getOrderSummary({final CartModel? currentModel}) =>
      runStoreSecondaryFunction(() async {
        orderSummary = await checkoutRepository.getOrderSummary(
          cartId: currentModel?.id ?? cartId!,
          schedulingDate:
              currentModel?.startSchedulingDate ?? data!.startSchedulingDate,
          orderType: currentModel != null
              ? currentModel.allowedOrderTypes.isEmpty
                  ? null
                  : currentModel.allowedOrderTypes.first
              : data!.allowedOrderTypes.isEmpty
                  ? null
                  : data!.allowedOrderTypes.first,
          couponCode:
              couponState == CouponState.applied ? valueOf('couponCode') : null,
        );
      });

  @action
  void applyCoupon() => runStoreSecondaryFunction(() async {
        if ((valueOf('couponCode') ?? '').length < 6) {
          return;
        }
        couponState = CouponState.loading;
        await checkoutRepository.checkCouponCode(
            cartId: cartId!, couponCode: valueOf('couponCode') ?? '');
        couponState = CouponState.applied;
        await getOrderSummary();
      }, onCatchError: (final _) {
        couponState = CouponState.wrong;
      });

  Future<void> deleteCart() async {
    final bool isConfirmingDeleting = await showCustomDialog(
            dialog: const ConfirmationDialog(
          content: null,
          mainActionText: 'Confirm',
        )) ??
        false;
    if (isConfirmingDeleting) {
      final String vendorId = data!.vendorId!;
      await clearCart();
      // ignore: unawaited_futures
      appRouter.replace(HomeRouteNavigation());
      await appRouter.push(VendorProductsRoute(
          args: VendorDetailsPageArguments(vendorId: vendorId)));
    }
  }

  Future<void> clearCart() async {
    await cartRepository.clearCart(cartId: cartId!);
    emptyCart(needToDiscardCart: false);
  }

  @action
  Future<void> deleteItem({required final String cartItemId}) =>
      updateItemQuantity(itemId: cartItemId, quantity: 0);

  @action
  void emptyCart({required final bool needToDiscardCart}) {
    if (needToDiscardCart) {
      cartId = null;
    }

    error = EmptyCartError();
    data = null;
    couponState = CouponState.entering;
    orderSummary = null;
    setValue('couponCode', '');
    orderCardMessage = null;
    setValue('orderCardMessage', '');
    cartItems = ObservableList();
  }

  @action
  void removeCoupon() {
    setValue('couponCode', '');
    getOrderSummary();
  }

  @action
  void submitOrderCardMessage() =>
      orderCardMessage = valueOf('orderCardMessage');

  @override
  Future<void> submitFunction() async {
    final CartModel currentCart = data!;
    await dataGetter();

    if (data != currentCart) {
      throw CartNewChangesError();
    }
  }

  @override
  Future<void> afterSuccessSubmitting() async {
    await appRouter.push(const CheckoutRoute());
  }

  @override
  void dispose() {
    locationReaction();
    super.dispose();
  }
}
