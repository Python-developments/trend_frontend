import 'package:injectable/injectable.dart';
import 'package:trend/data/dtos/complaint_dto.dart';
import 'package:trend/data/dtos/order_cancelling_dto.dart';
import 'package:trend/data/dtos/rate_order_dto.dart';
import 'package:trend/data/models/orders/order_details_model.dart';
import 'package:trend/data/models/orders/order_model.dart';
import 'package:trend/data/models/orders/order_negative_reason_model.dart';
import 'package:trend/data/models/core/pagination_data_model.dart';
import 'package:trend/data/repositories/abstract/i_orders_repository.dart';
import 'package:trend/data/repositories/abstract/i_repository_impl.dart';

@Singleton(as: IOrdersRepository)
class OrdersRepository extends IOrdersRepository {
  OrdersRepository(super.appFlavor,super.httpClient, super.appDatabase, super.logger,super.currentLocationController,);

  @override
  Future<void> complaintOrder(
          {required final String orderId,
          required final ComplaintDto complaintDto}) =>
      post(
          needLocation: false,
          url: 'customer/orders/complain/$orderId',
          parameters: complaintDto.toJson(),
          mapper: emptyMapper);
  @override
  Future<OrderDetailsModel> getOrderDetails({required final String orderId}) =>
      getObject(
        url: 'customer/orders/$orderId',
        mapper: OrderDetailsModel.fromJson,
        needLocation: false,
      );
  @override
  Future<void> rateOrder({required final RateOrderDto ratingDto}) async => post(
      url: 'store/reviews',
      needLocation: false,
      parameters: ratingDto.toJson(),
      mapper: emptyMapper);
  @override
  Future<PaginationDataModel<OrderModel>> getActiveOrders(
          {required final int pageNumber, required final int perPage}) async =>
      getPagination(
          url: 'customer/orders',
          needLocation: false,
          page: pageNumber,
          perPage: perPage,
          parameters: {
            'filter.status':
                'in::pendingShopApproval,scheduled,preparing,readyForPickup,outForDelivery',
          },
          mapper: OrderModel.fromJson);
  @override
  Future<PaginationDataModel<OrderModel>> getCompletedOrders(
          {required final int pageNumber, required final int perPage}) async =>
      getPagination(
          url: 'customer/orders',
          needLocation: false,
          page: pageNumber,
          perPage: perPage,
          parameters: {
            'filter.status': 'in::rejected,canceled,completed',
          },
          mapper: OrderModel.fromJson);

  @override
  Future<void> sendCancellationRequest(
          {required final String orderId,
          required final OrderCancellingDto orderCancellingDto}) =>
      delete(
          needLocation: false,
          url: 'customer/orders/cancel/$orderId',
          parameters: orderCancellingDto.toJson());

  @override
  Future<List<OrderNegativeReasonModel>> getNegativeOptions() async =>
      (await getPagination(
              url: 'customer/orders/cancel-reasons',
              needLocation: false,
              mapper: OrderNegativeReasonModel.fromJson,
              page: 1,
              perPage: 100,
              parameters: {}))
          .items;
}
