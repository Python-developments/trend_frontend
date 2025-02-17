import 'package:json_annotation/json_annotation.dart';
import 'package:trend/data/models/core/base_model.dart';
import 'package:trend/data/models/days_before_events_reminder_model.dart';
import 'package:trend/data/models/core/file_response_model.dart';

import 'package:trend/core/utils/global.dart';

part 'event_model.g.dart';

@JsonSerializable()
class EventModel extends BaseModel {

  @JsonKey(name: 'title',defaultValue:Global.generateDefaultValue ? '':null)
  final String eventName;
  @JsonKey(name: 'date', fromJson: _eventDateConstructor,
      defaultValue:Global.generateDefaultValue ?Global.defaultDateTime:null)
  final DateTime eventDate;
  @JsonKey(name: 'description')
  final String? eventDescription;
  final FileResponseModel? image;
  @JsonKey(defaultValue:Global.generateDefaultValue ? []:null)
  final List<DaysBeforeEventsReminderModel> reminders;

  EventModel(
      {required super.id,
      required this.eventDate,
      required this.eventDescription,
      required this.eventName,
      required this.image,
      required this.reminders});

  factory EventModel.fromJson(final Map<String, dynamic> data) =>
      _$EventModelFromJson(data);

  static DateTime _eventDateConstructor(final String value) {
    final List<String> dateParts = value.split('-');
    final int day = int.parse(dateParts[0]), month = int.parse(dateParts[1]);

    return DateTime(DateTime.now().year, month, day);
  }

  factory EventModel.empty()=>EventModel(
    id: '',
    eventDate: DateTime.now(),
    eventDescription: '',
    eventName: '',
    image: null,
    reminders: [],
  );
}
