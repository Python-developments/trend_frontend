import 'dart:io';

import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:injectable/injectable.dart';

import 'package:trend/core/utils/extensions.dart';
import 'package:trend/core/utils/flavors.dart';
import 'package:trend/data/errors/checkout_errors.dart';
import 'package:trend/data/models/cart/cart_item_model.dart';
import 'package:trend/data/models/orders/payment_card_details_model.dart';
import 'package:trend/data/models/orders/payment_card_model.dart';
import 'package:trend/third_parties_modules/abstract/i_payments_module.dart';

@Singleton(as: IPaymentsModule)
class PaymentsModule extends IPaymentsModule {
  final Flavor appFlavor;

  PaymentsModule(this.appFlavor);
  @override
  Future<void> init() async {
    Stripe.publishableKey = appFlavor.stripePublishableKey;
    Stripe.merchantIdentifier = dotenv.get('iosStripeMerchantIdentifier');
    await Stripe.instance.applySettings();
  }

  @override
  Future<void> handleSecurePayment(
      {required final String clientSecret,
      required final String? returnUrl}) async {
    try {
      await Stripe.instance
          .handleNextAction(clientSecret, returnURL: returnUrl);
    } catch (e) {
      throw PaymentFailedError();
    }
  }

  @override
  Future<PaymentCardModel> addNewCard({
    required final String username,
    required final String email,
    required final String phoneNumber,
  }) async {
    try {
      final PaymentMethod result = await Stripe.instance.createPaymentMethod(
          params: PaymentMethodParams.card(
              paymentMethodData: PaymentMethodData(
                  billingDetails: BillingDetails(
            name: username,
            email: email,
            phone: phoneNumber,
          ))),
          options: const PaymentMethodOptions(
              setupFutureUsage: PaymentIntentsFutureUsage.OnSession));

      return PaymentCardModel(
          id: result.id,
          cardDetails: PaymentCardDetailsModel(
              lastFourDigits: result.card.last4 ?? '',
              cardType: result.card.brand ?? ''));
    } catch (_) {
      throw AddNewPaymentCardError();
    }
  }

  @override
  Future<String> usePlatformPay(
      {required final String clientSecret,
      required final List<CartItemModel> cartItems}) async {
    try {
      return Platform.isIOS
          ? _useApplePay(clientSecret: clientSecret, cartItems: cartItems)
          : _useGooglePay(clientSecret: clientSecret);
    } catch (_) {
      throw PaymentFailedError();
    }
  }

  Future<String> _useGooglePay({required final String clientSecret}) async {
    final PaymentIntent result =
        await Stripe.instance.confirmPlatformPayPaymentIntent(
            clientSecret: clientSecret,
            confirmParams: PlatformPayConfirmParams.googlePay(
              googlePay: GooglePayParams(
                  testEnv: appFlavor.showErrors,
                  merchantName: 'WOW VIR',
                  currencyCode: 'AED',
                  merchantCountryCode: 'AE'),
            )
            // PresentGooglePayParams(clientSecret: clientSecret),
            );

    if (result.paymentMethodId == null) {
      throw PaymentFailedError();
    }
    return result.paymentMethodId!;
  }

  Future<String> _useApplePay(
      {required final String clientSecret,
      required final List<CartItemModel> cartItems}) async {
    bool isApplePaySupported = await isPlatformPaySupported();

    if (!isApplePaySupported) {
      await Stripe.instance.openApplePaySetup();
      isApplePaySupported = await isPlatformPaySupported();
    }
    if (isApplePaySupported) {
      final PaymentIntent result =
          await Stripe.instance.confirmPlatformPayPaymentIntent(
              clientSecret: clientSecret,
              confirmParams: PlatformPayConfirmParams.applePay(
                applePay: ApplePayParams(
                    currencyCode: 'AED',
                    merchantCountryCode: 'AE',
                    cartItems: cartItems
                        .map((final e) => ApplePayCartSummaryItem.immediate(
                              label: e.product.name,
                              amount: e.totalPrice.toString(),
                            ))
                        .toList()
                      ..add(ApplePayCartSummaryItem.immediate(
                        label: 'WOW VIR',
                        amount: '${cartItems.totalCost}',
                      ))),
              ));
      if (result.paymentMethodId == null) {
        throw PaymentFailedError();
      }
      return result.paymentMethodId!;
    }
    throw PaymentFailedError();
  }

  @override
  Future<bool> isPlatformPaySupported() =>
      Stripe.instance.isPlatformPaySupported(
          googlePay: IsGooglePaySupportedParams(
              testEnv: appFlavor.showErrors, supportsTapToPay: false));
}
