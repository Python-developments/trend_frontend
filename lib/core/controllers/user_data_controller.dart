import 'package:injectable/injectable.dart';
import 'package:mobx/mobx.dart';
import 'package:trend/core/controllers/base_controller.dart';
import 'package:trend/core/controllers/cart_controller.dart';
import 'package:trend/features/addresses/controllers/addresses_controller.dart';
import 'package:trend/features/checkout/controllers/payment_methods_controller.dart';

part 'user_data_controller.g.dart';

@singleton
class UserDataController extends UserDataControllerBase
    with _$UserDataController {
  UserDataController(super.cartController, super.paymentMethodsController,
      super.addressesController, super.logger,super.appRouter,super.snakeBarShower);
}

abstract class UserDataControllerBase extends BaseController with Store {
  final CartController cartController;
  final PaymentMethodsController paymentMethodsController;
  final AddressesController addressesController;

  UserDataControllerBase(this.cartController, this.paymentMethodsController,
      this.addressesController, super.logger,super.appRouter,super.snakeBarShower);

  @override
  bool get isLazyController => true;

  Future<void> refreshData() => Future.wait([
        cartController.loadData(),
        paymentMethodsController.loadData(),
        addressesController.loadData(),
      ]);

  void emptyUserData() {
    cartController.emptyCart(needToDiscardCart: true);
    paymentMethodsController.emptyMethods();
    addressesController.clearAddresses();
  }
}
