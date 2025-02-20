import 'package:injectable/injectable.dart';
import 'package:trend/data/models/core/notification_model.dart';
import 'package:trend/data/repositories/abstract/i_profile_repository.dart';
import 'package:trend/data/repositories/abstract/i_repository.dart';

@Singleton(as: IProfileRepository)
class ProfileRepository extends IProfileRepository {
  ProfileRepository(super.appFlavor,super.httpClient, super.appDatabase, super.logger,);

  @override
  Future<List<NotificationModel>> getNotifications() =>
      getList(
          url: 'notifications/all/',
          parameters: {},
          mapper: NotificationModel.fromJson,
          );
  @override
  Future<void> changeAppLanguage({required final String languageCode}) => put(
      url: 'customers/profile',

      parameters: {'language': languageCode},
      mapper: emptyMapper);
}
