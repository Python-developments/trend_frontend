import 'package:trend/core/utils/enums.dart';

class OrderNegativeRequestPageArguments {
  final String orderId;
  final OrderStatus orderStatus;
  final SupportType supportType;

  OrderNegativeRequestPageArguments(
      {required this.orderId, required this.orderStatus , required this.supportType});
}
