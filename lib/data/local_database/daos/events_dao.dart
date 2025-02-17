
import 'package:drift/drift.dart';
import 'package:trend/data/local_database/daos/i_crud_dao.dart';
import 'package:trend/data/local_database/databases/concrete/app_local_database.dart';
import 'package:trend/data/local_database/tables/base_cache_table.dart';
import 'package:trend/data/local_database/tables/events.dart';
import 'package:trend/data/models/core/file_response_model.dart';
import 'package:trend/data/models/days_before_events_reminder_model.dart';
import 'package:trend/data/models/event_model.dart';

part 'events_dao.g.dart';

@DriftAccessor(tables: [Events])
class EventsDao extends ICrudDao<Event> with _$EventsDaoMixin {

  EventsDao(super.attachedDatabase);

  @override
  String entityIdGetter(final Event entity)=>entity.id;

  @override
  TableInfo<BaseCacheTable, Event> get table => events;

  Future<EventModel> getUserEvent({required final String eventId}) async {
    final Event? result= await getEntityById(eventId);
    return _transformer(result!);
  }

  Future<void> upsertUserEvent({required final EventModel event})async{
    await deleteEntity(event.id);
    await insertEntity(_reverseTransformer(event));
  }

  Future<List<EventModel>> getUserEvents()async=>(await getAllEntities()).map(_transformer).toList();

  Future<void> insertUserEvents({required final List<EventModel> userEvents})async{
    await deleteAllEntities();
    await insertAll(userEvents.map(_reverseTransformer).toList());
  }



  Future<void>deleteUserEvent({required final String eventId})=>deleteEntity(eventId);

  EventModel _transformer(final Event event)=>EventModel(
      id:event.id,
      eventDate:event.date,
      eventDescription:event.description,
      eventName:event.name,
      image:FileResponseModel(id: '', url: event.imagePath),
      reminders:event.reminders.map((final reminder)=>DaysBeforeEventsReminderModel(
  unit: 'days',days:reminder,
  )).toList(
      ));

  Event _reverseTransformer(final EventModel event)=>Event(
    id:event.id,
    name: event.eventName,
    description: event.eventDescription,
    date: event.eventDate,
    reminders: Uint8List.fromList(event.reminders.map((final r)=>r.days).toList()),
    imagePath: event.image?.url,
  );
}

