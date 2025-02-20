import 'package:trend/data/models/core/notification_model.dart';
import 'package:trend/data/repositories/abstract/i_repository.dart';

abstract class IProfileRepository extends IRepository {
  IProfileRepository(super.appFlavor,super.httpClient, super.appDatabase, super.logger,);

  Future<List<NotificationModel>> getNotifications();
  Future<void> changeAppLanguage({required final String languageCode});
}
