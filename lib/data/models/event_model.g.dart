// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'event_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

EventModel _$EventModelFromJson(Map<String, dynamic> json) => EventModel(
      id: json['_id'] as String,
      eventDate: json['date'] == null
          ? Global.defaultDateTime()
          : EventModel._eventDateConstructor(json['date'] as String),
      eventDescription: json['description'] as String?,
      eventName: json['title'] as String? ?? '',
      image: json['image'] == null
          ? null
          : FileResponseModel.fromJson(json['image'] as Map<String, dynamic>),
      reminders: (json['reminders'] as List<dynamic>?)
              ?.map((e) => DaysBeforeEventsReminderModel.fromJson(
                  e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$EventModelToJson(EventModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'title': instance.eventName,
      'date': instance.eventDate.toIso8601String(),
      'description': instance.eventDescription,
      'image': instance.image?.toJson(),
      'reminders': instance.reminders.map((e) => e.toJson()).toList(),
    };
