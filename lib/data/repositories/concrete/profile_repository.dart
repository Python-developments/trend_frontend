import 'package:injectable/injectable.dart';
import 'package:trend/data/models/core/pagination_data_model.dart';
import 'package:trend/data/repositories/abstract/i_profile_repository.dart';
import 'package:trend/data/repositories/abstract/i_repository.dart';
import 'package:trend/features/notifications/data/models/notification_model.dart';

@Singleton(as: IProfileRepository)
class ProfileRepository extends IProfileRepository {
  ProfileRepository(super.appFlavor,super.httpClient, super.appDatabase, super.logger,);

  @override
  Future<PaginationDataModel<NotificationModel>> getNotifications(
          {required final int pageNumber, required final int perPage}) =>
      getPagination(
          url: 'customer/notifications',
          page: pageNumber,
          perPage: perPage,
          parameters: {},
          mapper: NotificationModel.fromJson,
          );
  @override
  Future<void> changeAppLanguage({required final String languageCode}) => put(
      url: 'customers/profile',

      parameters: {'language': languageCode},
      mapper: emptyMapper);
}
