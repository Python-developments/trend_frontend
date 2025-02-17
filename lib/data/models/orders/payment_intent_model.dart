class PaymentIntentModel {
  final String orderId;
  final String? clientSecret, returnUrl;
  PaymentIntentModel(
      {required this.orderId,
      required this.clientSecret,
      required this.returnUrl});

  factory PaymentIntentModel.fromJson(final Map<String, dynamic> data) =>
      PaymentIntentModel(
        orderId: data['orderId'],
        clientSecret: data['clientSecret'],
        returnUrl: data['nextAction']?['redirect_to_url']?['return_url'],
      );
}
