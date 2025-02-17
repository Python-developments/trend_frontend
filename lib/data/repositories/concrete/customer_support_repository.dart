import 'package:injectable/injectable.dart';
import 'package:trend/data/dtos/join_as_vendor_dto.dart';
import 'package:trend/data/dtos/support_request_dto.dart';
import 'package:trend/data/repositories/abstract/i_repository_impl.dart';
import 'package:trend/data/repositories/abstract/i_customer_support_repository.dart';

@Singleton(as: ICustomerSupportRepository)
class CustomerSupportRepository extends ICustomerSupportRepository {
  CustomerSupportRepository(super.appFlavor,super.httpClient, super.appDatabase, super.logger,
      super.currentLocationController);

  @override
  Future<void> sendSupportRequest(
          {required final SupportRequestDto supportRequestDto}) =>
      post(
          url: 'store/support',
          needLocation: false,
          parameters: supportRequestDto.toJson(),
          mapper: emptyMapper);

  @override
  Future<void> sendJoinAsVendorRequest(
          {required final JoinAsVendorDto joinRequestDto}) =>
      post(
          url: 'vendors/become-partner',
          needLocation: false,
          parameters: joinRequestDto.toJson(),
          mapper: emptyMapper);

  /*@override
  Future<String> getSupportChatUrl() async{
    return 'test';
  }

  @override
  Future<PaginationDataModel<ChattingMessageModel>> getSupportChattingHistory({required final int pageNumber,required final int perPage }) async{
    return PaginationDataModel.empty(ChattingMessageModel.empty());
  }

  @override
  Future<String> getVendorChatUrl({required final int vendorId}) async{
    return 'test';
  }

  @override
  Future<PaginationDataModel<ChattingMessageModel>> getVendorChattingHistory({required final int vendorId, required final int pageNumber}) async =>
      PaginationDataModel.empty(ChattingMessageModel.empty());

  @override
  Future<PaginationDataModel<ChatHistoryModel>> getChattingHistory({required final int pageNumber,required final int perPage }) async =>
      PaginationDataModel.empty(ChatHistoryModel.empty());*/
}
