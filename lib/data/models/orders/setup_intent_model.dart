class SetupIntentModel {
  final String clientSecret, customerId, ephemeralKey;
  SetupIntentModel(
      {required this.clientSecret,
      required this.customerId,
      required this.ephemeralKey});

  factory SetupIntentModel.fromJson(final Map<String, dynamic> data) =>
      SetupIntentModel(
          clientSecret: data['setupIntent']['client_secret'],
          customerId: data['customer'],
          ephemeralKey: data['ephemeralKey']['secret']);
}
