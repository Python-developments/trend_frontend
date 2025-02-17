import 'package:trend/features/checkout/controllers/checkout_controller.dart';

class CheckoutAddressControllerArguments {
  final CheckoutControllerBase checkoutController;
  final bool isPersonalOrder;
  CheckoutAddressControllerArguments(
      {required this.checkoutController, required this.isPersonalOrder});
}
