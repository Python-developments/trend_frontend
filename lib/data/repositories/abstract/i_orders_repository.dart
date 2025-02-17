import 'package:trend/data/dtos/complaint_dto.dart';
import 'package:trend/data/dtos/order_cancelling_dto.dart';
import 'package:trend/data/dtos/rate_order_dto.dart';
import 'package:trend/data/models/orders/order_details_model.dart';
import 'package:trend/data/models/orders/order_model.dart';
import 'package:trend/data/models/orders/order_negative_reason_model.dart';
import 'package:trend/data/models/core/pagination_data_model.dart';
import 'package:trend/data/repositories/abstract/i_repository_impl.dart';

abstract class IOrdersRepository extends IRepositoryImpl {
  IOrdersRepository(super.currentLocationController,super.appFlavor,super.httpClient, super.appDatabase, super.logger,);

  Future<PaginationDataModel<OrderModel>> getActiveOrders(
      {required final int pageNumber, required final int perPage});
  Future<PaginationDataModel<OrderModel>> getCompletedOrders(
      {required final int pageNumber, required final int perPage});
  Future<OrderDetailsModel> getOrderDetails({required final String orderId});
  Future<void> rateOrder({required final RateOrderDto ratingDto});
  Future<void> complaintOrder(
      {required final String orderId,
      required final ComplaintDto complaintDto});
  Future<void> sendCancellationRequest(
      {required final String orderId,
      required final OrderCancellingDto orderCancellingDto});
  Future<List<OrderNegativeReasonModel>> getNegativeOptions();
}
