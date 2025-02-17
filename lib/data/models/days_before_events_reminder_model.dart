import 'package:freezed_annotation/freezed_annotation.dart';

import 'package:trend/core/utils/global.dart';

part 'days_before_events_reminder_model.g.dart';

@JsonSerializable()
class DaysBeforeEventsReminderModel {
  @JsonKey(defaultValue:Global.generateDefaultValue ? '':null)
  final String unit;
  @JsonKey(name: 'value',defaultValue:Global.generateDefaultValue ? 0:null)
  final int days;

  DaysBeforeEventsReminderModel({required this.unit, required this.days});

  factory DaysBeforeEventsReminderModel.fromJson(
          final Map<String, dynamic> data) =>
      _$DaysBeforeEventsReminderModelFromJson(data);

  Map<String, dynamic> toJson() => _$DaysBeforeEventsReminderModelToJson(this);
}
