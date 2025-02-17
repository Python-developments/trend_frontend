// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventDto _$EventDtoFromJson(Map<String, dynamic> json) => EventDto(
      eventName: json['title'] as String,
      eventDate: DateTime.parse(json['date'] as String),
      imageId: json['image'] as String?,
      eventDescription: json['description'] as String?,
      reminders: (json['reminders'] as List<dynamic>)
          .map((e) =>
              DaysBeforeEventsReminderModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$EventDtoToJson(EventDto instance) => <String, dynamic>{
      'title': instance.eventName,
      'date': EventDto._eventDateFormatter(instance.eventDate),
      'description': instance.eventDescription,
      'image': instance.imageId,
      'reminders': instance.reminders.map((e) => e.toJson()).toList(),
    };
