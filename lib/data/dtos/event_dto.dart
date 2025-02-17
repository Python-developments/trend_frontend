import 'package:intl/intl.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:trend/data/models/days_before_events_reminder_model.dart';

part 'event_dto.g.dart';

@JsonSerializable()
class EventDto {
  @JsonKey(name: 'title')
  final String eventName;

  @JsonKey(name: 'date', toJson: _eventDateFormatter)
  final DateTime eventDate;
  @JsonKey(name: 'description')
  final String? eventDescription;

  @JsonKey(name: 'image')
  final String? imageId;

  final List<DaysBeforeEventsReminderModel> reminders;

  EventDto({
    required this.eventName,
    required this.eventDate,
    required this.imageId,
    required this.eventDescription,
    required this.reminders,
  });

  Map<String, dynamic> toJson() => _$EventDtoToJson(this);

  static String _eventDateFormatter(final DateTime date) =>
      DateFormat('dd-MM').format(date);
}
