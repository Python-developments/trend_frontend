import 'package:trend/data/models/core/notification_model.dart';
import 'package:trend/data/models/core/pagination_data_model.dart';
import 'package:trend/data/repositories/abstract/i_repository_impl.dart';

abstract class IProfileRepository extends IRepositoryImpl {
  IProfileRepository(super.appFlavor,super.httpClient, super.appDatabase, super.logger,
      super.currentLocationController);

  Future<PaginationDataModel<NotificationModel>> getNotifications(
      {required final int pageNumber, required final int perPage});
  Future<void> changeAppLanguage({required final String languageCode});
}
