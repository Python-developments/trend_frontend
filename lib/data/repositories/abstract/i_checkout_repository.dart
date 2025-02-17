import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/dtos/checkout_dto.dart';
import 'package:trend/data/models/orders/order_summary_model.dart';
import 'package:trend/data/models/orders/payment_card_model.dart';
import 'package:trend/data/models/orders/payment_intent_model.dart';
import 'package:trend/data/models/orders/scheduling_date_option_model.dart';
import 'package:trend/data/models/orders/setup_intent_model.dart';
import 'package:trend/data/repositories/abstract/i_repository_impl.dart';

abstract class ICheckoutRepository extends IRepositoryImpl {
  ICheckoutRepository(super.appFlavor,super.httpClient, super.appDatabase, super.logger,
      super.currentLocationController);

  Future<OrderSummaryModel> getOrderSummary(
      {required final String cartId,
      required final OrderType? orderType,
      required final String? couponCode,
      required final DateTime? schedulingDate});
  Future<PaymentIntentModel> processCheckout(
      {required final CheckoutDto checkoutDto});
  Future<List<DayShortcut>> getAvailableSchedulingDays(
      {required final String cartId});

  Future<List<SchedulingDateOptionModel>> getAvailableSchedulingOptions(
      {required final String cartId,
      required final DateTime desiredDay,
      required final OrderType orderType});

  Future<void> checkCouponCode(
      {required final String cartId, required final String couponCode});
  Future<List<PaymentCardModel>> getUserCards();
  Future<SetupIntentModel> getSetupIntent();
  Future<void> deletePaymentCard({required final String cardId});
}
