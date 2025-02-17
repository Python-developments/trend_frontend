import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trend/data/models/core/location_model.dart';

part 'location_tracking_message_model.freezed.dart';
part 'location_tracking_message_model.g.dart';

@Freezed(unionKey: 'event')
class LocationTrackingMessageModel with _$LocationTrackingMessageModel {
  const LocationTrackingMessageModel._();
  @FreezedUnionValue('order:tracking:update')
  factory LocationTrackingMessageModel.newLocationMessage({
    required final double latitude,
    required final double longitude,
    required final String driverName,
    required final String driverPhone,
  }) = NewLocationMessage;

  @FreezedUnionValue('tracking:error')
  @FreezedUnionValue('end:tracking')
  factory LocationTrackingMessageModel.finishTrackingMessage() =
      FinishTrackingMessage;

  factory LocationTrackingMessageModel.fromJson(
          final Map<String, dynamic> data) =>
      _$LocationTrackingMessageModelFromJson(data);

  LocationModel get toLocationModel => LocationModel(
      (this as NewLocationMessage).latitude,
      (this as NewLocationMessage).longitude);
}
