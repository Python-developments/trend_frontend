class RateOrderBottomSheetArguments {
  final String orderId;
  final void Function()? pageRefresher;

  RateOrderBottomSheetArguments(
      {required this.orderId, required this.pageRefresher});
}
