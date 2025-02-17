// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'location_tracking_message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$NewLocationMessageImpl _$$NewLocationMessageImplFromJson(
        Map<String, dynamic> json) =>
    _$NewLocationMessageImpl(
      latitude: (json['latitude'] as num).toDouble(),
      longitude: (json['longitude'] as num).toDouble(),
      driverName: json['driverName'] as String,
      driverPhone: json['driverPhone'] as String,
      $type: json['event'] as String?,
    );

Map<String, dynamic> _$$NewLocationMessageImplToJson(
        _$NewLocationMessageImpl instance) =>
    <String, dynamic>{
      'latitude': instance.latitude,
      'longitude': instance.longitude,
      'driverName': instance.driverName,
      'driverPhone': instance.driverPhone,
      'event': instance.$type,
    };

_$FinishTrackingMessageImpl _$$FinishTrackingMessageImplFromJson(
        Map<String, dynamic> json) =>
    _$FinishTrackingMessageImpl(
      $type: json['event'] as String?,
    );

Map<String, dynamic> _$$FinishTrackingMessageImplToJson(
        _$FinishTrackingMessageImpl instance) =>
    <String, dynamic>{
      'event': instance.$type,
    };
