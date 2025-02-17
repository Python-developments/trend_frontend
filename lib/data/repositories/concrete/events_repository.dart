import 'package:injectable/injectable.dart';
import 'package:trend/data/dtos/event_dto.dart';
import 'package:trend/data/models/event_model.dart';
import 'package:trend/data/repositories/abstract/i_events_repository.dart';
import 'package:trend/data/repositories/abstract/i_repository_impl.dart';

@Singleton(as: IEventsRepository)
class EventsRepository extends IEventsRepository {
  EventsRepository(super.appFlavor,super.httpClient, super.appDatabase, super.logger,
      super.currentLocationController);

  @override
  Future<EventModel> getEventDetails({required final String eventId}) =>
      getObject(
          url: 'store/events/$eventId',
          needLocation: false,
          mapper: EventModel.fromJson);
  @override
  Future<void> addNewEvent({required final EventDto eventDto}) => post(
      url: 'store/events',
      needLocation: false,
      parameters: eventDto.toJson(),
      mapper: emptyMapper);

  @override
  Future<void> deleteEvent({required final String eventId}) =>
      delete(url: 'store/events/$eventId', needLocation: false);

  @override
  Future<void> editEvent(
          {required final String eventId, required final EventDto eventDto}) =>
      put(
          url: 'store/events/$eventId',
          needLocation: false,
          parameters: eventDto.toJson(),
          mapper: emptyMapper);

  @override
  Future<List<EventModel>> getUpcomingEvents() => getList(
      url: 'store/events', needLocation: false, mapper: EventModel.fromJson);
}
