// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'days_before_events_reminder_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

DaysBeforeEventsReminderModel _$DaysBeforeEventsReminderModelFromJson(
        Map<String, dynamic> json) =>
    DaysBeforeEventsReminderModel(
      unit: json['unit'] as String? ?? '',
      days: (json['value'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$DaysBeforeEventsReminderModelToJson(
        DaysBeforeEventsReminderModel instance) =>
    <String, dynamic>{
      'unit': instance.unit,
      'value': instance.days,
    };
