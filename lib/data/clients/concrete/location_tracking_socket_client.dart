import 'package:injectable/injectable.dart';
import 'package:trend/data/clients/concrete/web_socket_client.dart';
import 'package:trend/data/models/orders/location_tracking_message_model.dart';

@singleton
class LocationTrackingSocketClient
    extends WebSocketClient<LocationTrackingMessageModel> {
  LocationTrackingSocketClient(super.flavor, super.socketConnectorModule);

  @override
  LocationTrackingMessageModel messageFromJson(
          final Map<String, dynamic> data) =>
      LocationTrackingMessageModel.fromJson(data);

  @override
  String get path => '/orderTracking/';
}
