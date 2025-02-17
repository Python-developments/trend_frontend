// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scheduling_date_option_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SchedulingDateOptionModel _$SchedulingDateOptionModelFromJson(
        Map<String, dynamic> json) =>
    SchedulingDateOptionModel(
      from: json['from'] == null
          ? Global.defaultDateTime()
          : DateTime.parse(json['from'] as String),
      to: json['to'] == null
          ? Global.defaultDateTime()
          : DateTime.parse(json['to'] as String),
    );

Map<String, dynamic> _$SchedulingDateOptionModelToJson(
        SchedulingDateOptionModel instance) =>
    <String, dynamic>{
      'from': instance.from.toIso8601String(),
      'to': instance.to.toIso8601String(),
    };
