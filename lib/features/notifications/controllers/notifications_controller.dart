import 'package:injectable/injectable.dart';
import 'package:trend/core/controllers/pagination_list_data_loader.dart';
import 'package:trend/data/errors/core_errors.dart';
import 'package:trend/data/errors/custom_error.dart';
import 'package:trend/data/models/core/notification_model.dart';
import 'package:trend/data/models/core/pagination_data_model.dart';
import 'package:trend/data/repositories/abstract/i_profile_repository.dart';

@injectable
class NotificationsController extends PaginationListDataLoader<NotificationModel> {
  final IProfileRepository profileRepository;

  NotificationsController(this.profileRepository, super.logger, super.appRouter, super.snakeBarShower);

  @override
  Future<PaginationDataModel<NotificationModel>> paginationGetter({required final int pageNumber, required final int perPage}) =>
      profileRepository.getNotifications(pageNumber: pageNumber, perPage: perPage);
  @override
  CustomError? get emptyError => EmptyDataError(entityName: 'notifications');
}
