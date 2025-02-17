import 'package:injectable/injectable.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/dtos/checkout_dto.dart';
import 'package:trend/data/models/orders/order_summary_model.dart';
import 'package:trend/data/models/orders/payment_card_model.dart';
import 'package:trend/data/models/orders/payment_intent_model.dart';
import 'package:trend/data/models/orders/scheduling_date_option_model.dart';
import 'package:trend/data/models/orders/setup_intent_model.dart';
import 'package:trend/data/repositories/abstract/i_checkout_repository.dart';
import 'package:trend/data/repositories/abstract/i_repository_impl.dart';

@Singleton(as: ICheckoutRepository)
class CheckoutRepository extends ICheckoutRepository {
  CheckoutRepository(super.appFlavor,super.httpClient, super.appDatabase, super.logger,
      super.currentLocationController);

  @override
  Future<OrderSummaryModel> getOrderSummary(
          {required final String cartId,
          required final OrderType? orderType,
          required final String? couponCode,
          required final DateTime? schedulingDate}) =>
      post(
          url: 'customer/orders/$cartId/summary',
          parameters: {
            'fulfillmentType': orderType?.name,
            'couponCode': couponCode,
            if (schedulingDate != null) 'date': schedulingDate.toIso8601String()
          },
          needLocation: true,
          mapper: (final data) => OrderSummaryModel.fromJson(data));
  @override
  Future<PaymentIntentModel> processCheckout(
          {required final CheckoutDto checkoutDto}) =>
      post(
          url: 'customer/orders/create-order',
          needLocation: true,
          parameters: {
            ...checkoutDto.toJson(),
            'orderFor': checkoutDto.recipientName == null ? 'self' : 'gift'
          },
          mapper: PaymentIntentModel.fromJson);

  @override
  Future<void> checkCouponCode(
          {required final String cartId, required final String couponCode}) =>
      getObject(
          needLocation: false,
          url: 'customer/orders/$cartId/coupon/$couponCode',
          mapper: emptyMapper);

  @override
  Future<List<DayShortcut>> getAvailableSchedulingDays(
          {required final String cartId}) async =>
      getObject(
          url: 'customer/orders/available-dates/$cartId',
          needLocation: false,
          mapper: (final data) {
            final List<dynamic> dynamicData = data['shopWorkingDays'];
            return dynamicData
                .map((final e) => DayShortcut.values
                    .firstWhere((final element) => element.shortcutName == e))
                .toList();
          });
  @override
  Future<List<SchedulingDateOptionModel>> getAvailableSchedulingOptions(
          {required final String cartId,
          required final DateTime desiredDay,
          required final OrderType orderType}) =>
      getList(
          url:
              'customer/orders/hoursIn/$cartId/${desiredDay.toIso8601String()}/${orderType.name}',
          needLocation: false,
          mapper: SchedulingDateOptionModel.fromJson);
  @override
  Future<List<PaymentCardModel>> getUserCards() => getList(
      url: 'stripe/payment-methods',
      mapper: PaymentCardModel.fromJson,
      needLocation: false);
  @override
  Future<SetupIntentModel> getSetupIntent() => getObject(
      url: 'stripe/setup-intent',
      mapper: SetupIntentModel.fromJson,
      needLocation: true);

  @override
  Future<void> deletePaymentCard({required final String cardId}) =>
      delete(url: 'stripe/payment-methods/$cardId', needLocation: false);
}
