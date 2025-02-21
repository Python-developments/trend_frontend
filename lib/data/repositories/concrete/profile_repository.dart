import 'package:injectable/injectable.dart';
import 'package:trend/data/models/core/notification_model.dart';
import 'package:trend/data/repositories/abstract/i_profile_repository.dart';
import 'package:trend/data/repositories/abstract/i_repository.dart';

@Singleton(as: IProfileRepository)
class ProfileRepository extends IProfileRepository {
  ProfileRepository(super.appFlavor,super.httpClient, super.appDatabase, super.logger,);

  @override
  Future<List<NotificationModel>> getNotifications() =>
      getObject(
          url: 'notifications/all/',
          parameters: {},
          mapper:(final data){
            final List<dynamic>results=data['notifications'];
            return results.map((final notification)=>NotificationModel.fromJson(notification)).toList();
          },
          );
  @override
  Future<void> changeAppLanguage({required final String languageCode}) => put(
      url: 'customers/profile',

      parameters: {'language': languageCode},
      mapper: emptyMapper);
}
