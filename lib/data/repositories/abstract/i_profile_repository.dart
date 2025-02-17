import 'package:trend/data/models/core/pagination_data_model.dart';
import 'package:trend/data/repositories/abstract/i_repository.dart';

abstract class IProfileRepository extends IRepository {
  IProfileRepository(super.appFlavor,super.httpClient, super.appDatabase, super.logger,);

  Future<PaginationDataModel<NotificationModel>> getNotifications(
      {required final int pageNumber, required final int perPage});
  Future<void> changeAppLanguage({required final String languageCode});
}
