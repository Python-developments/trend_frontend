import 'package:injectable/injectable.dart';
import 'package:trend/core/controllers/list_data_loader.dart';
import 'package:trend/data/errors/core_errors.dart';
import 'package:trend/data/errors/custom_error.dart';
import 'package:trend/data/models/core/notification_model.dart';
import 'package:trend/data/repositories/abstract/i_profile_repository.dart';

@injectable
class NotificationsController extends ListDataLoader<NotificationModel> {
  final IProfileRepository profileRepository;

  NotificationsController(this.profileRepository, super.logger, super.appRouter, super.snakeBarShower);

  @override
  Future<List<NotificationModel>> listGetter() => profileRepository.getNotifications();
  @override
  CustomError? get emptyError => EmptyDataError(entityName: 'notifications');
}
