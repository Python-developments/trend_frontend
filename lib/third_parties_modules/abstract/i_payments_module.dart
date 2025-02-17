import 'package:trend/data/models/cart/cart_item_model.dart';
import 'package:trend/data/models/orders/payment_card_model.dart';
import 'package:trend/third_parties_modules/abstract/i_module.dart';

abstract class IPaymentsModule extends IModule {
  Future<void> init();
  Future<PaymentCardModel> addNewCard({
    required final String username,
    required final String email,
    required final String phoneNumber,
  });
  Future<String> usePlatformPay(
      {required final String clientSecret,
      required final List<CartItemModel> cartItems});
  Future<bool> isPlatformPaySupported();
  Future<void> handleSecurePayment(
      {required final String clientSecret, required final String? returnUrl});
}
