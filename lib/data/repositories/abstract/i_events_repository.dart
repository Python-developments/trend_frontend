import 'package:trend/data/dtos/event_dto.dart';
import 'package:trend/data/models/event_model.dart';
import 'package:trend/data/repositories/abstract/i_repository_impl.dart';

abstract class IEventsRepository extends IRepositoryImpl {
  IEventsRepository(super.appFlavor,super.httpClient, super.appDatabase, super.logger,
      super.currentLocationController);

  Future<EventModel> getEventDetails({required final String eventId});
  Future<void> deleteEvent({required final String eventId});

  Future<List<EventModel>> getUpcomingEvents();

  Future<void> addNewEvent({required final EventDto eventDto});

  Future<void> editEvent(
      {required final String eventId, required final EventDto eventDto});
}
