import 'package:intl/intl.dart';
import 'package:live_activities/models/live_activity_file.dart';
import 'package:trend/core/presentation/assets.dart';
import 'package:trend/core/utils/enums.dart';

class OrderLiveActivityModel {
  final String orderId;
  final OrderStatus orderStatus;
  final OrderType orderType;
  final DateTime estimatedDeliveryTime;
  final String vendorName, imagePath;
  final OrderDeliveryBy orderDeliveryBy;
  final String orderNumber;
  final CategoryExtension categoryExtension;
  OrderLiveActivityModel({
    required this.orderId,
    required this.orderStatus,
    required this.orderDeliveryBy,
    required this.orderType,
    required this.estimatedDeliveryTime,
    required this.vendorName,
    required this.imagePath,
    required this.categoryExtension,
    required this.orderNumber,
  });

  Map<String, dynamic> toJson() => {
        'orderId': orderId,
        'orderNumber': orderNumber,
        'shouldTrack': orderStatus == OrderStatus.outForDelivery && orderDeliveryBy == OrderDeliveryBy.WowVir,
        'orderStatusDescription': orderStatus == OrderStatus.preparing
            ? 'Shop is preparing your order'
            : orderStatus == OrderStatus.outForDelivery
                ? orderDeliveryBy == OrderDeliveryBy.WowVir
                    ? 'Delivery agent is on the way'
                    : 'Shop driver is on the way'
                : orderStatus == OrderStatus.pendingShopApproval
                    ? 'Waiting for the shop to accept your order'
                    : '',
        'loadingIndicatorPercentage': orderType.trackingPlan.indexOf(orderStatus) / orderType.trackingPlan.length,
        'logoImagePath': LiveActivityFileFromAsset.image(Assets.appLogo, imageOptions: LiveActivityImageFileOptions(resizeFactor: 0.5)),
        'statusImage': LiveActivityFileFromAsset.image(
          orderStatus == OrderStatus.pendingShopApproval
              ? categoryExtension == CategoryExtension.CH
                  ? Assets.chocolateCategory
                  : categoryExtension == CategoryExtension.CK
                      ? Assets.cakeCategory
                      : categoryExtension == CategoryExtension.PR
                          ? Assets.perfumeCategory
                          : Assets.flowersCategory
              : orderStatus == OrderStatus.preparing
                  ? Assets.appLogo
                  : orderStatus == OrderStatus.outForDelivery
                      ? Assets.deliveringOrder
                      : '',
        ),
        'vendorName': vendorName,
        'earliestArrival': DateFormat('h:mm a').format(estimatedDeliveryTime.subtract(const Duration(minutes: 10))),
        'latestArrival': DateFormat('h:mm a').format(estimatedDeliveryTime.add(const Duration(minutes: 10))),
      };
}
