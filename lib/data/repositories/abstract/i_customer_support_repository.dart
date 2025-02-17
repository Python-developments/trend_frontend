import 'package:trend/data/dtos/join_as_vendor_dto.dart';
import 'package:trend/data/dtos/support_request_dto.dart';
import 'package:trend/data/repositories/abstract/i_repository_impl.dart';

abstract class ICustomerSupportRepository extends IRepositoryImpl {
  ICustomerSupportRepository(super.appFlavor,super.httpClient, super.appDatabase, super.logger,
      super.currentLocationController);

  Future<void> sendSupportRequest(
      {required final SupportRequestDto supportRequestDto});
  Future<void> sendJoinAsVendorRequest(
      {required final JoinAsVendorDto joinRequestDto});
/*  Future<String> getVendorChatUrl({required final int vendorId});
  Future<String> getSupportChatUrl();

  Future<PaginationDataModel<ChatHistoryModel>> getChattingHistory({required final int pageNumber,required final int perPage });

  Future<PaginationDataModel<ChattingMessageModel>> getSupportChattingHistory({required final int pageNumber,required final int perPage });
  Future<PaginationDataModel<ChattingMessageModel>> getVendorChattingHistory({required final int vendorId,required final int pageNumber,});*/
}
