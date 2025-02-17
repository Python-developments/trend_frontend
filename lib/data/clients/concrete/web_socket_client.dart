import 'dart:async';

import 'package:trend/core/utils/flavors.dart';
import 'package:trend/data/clients/abstract/i_web_socket_client.dart';

abstract class WebSocketClient<T> extends IWebSocketClient<T> {
  final Flavor flavor;
  WebSocketClient(this.flavor, super.socketConnectorModule);

  String get path;

  @override
  bool get hasConnection=>socketConnectorModule.hasConnection;

  @override
  StreamController<T> connect({required final Map<String, dynamic> headers,final void Function()?onConnectionInterruption}) =>
      socketConnectorModule.connect(
          url: flavor.baseUrl,
          path: path,
          headers: headers,
          messageFromJson: messageFromJson,
        onConnectionInterruption:onConnectionInterruption
      );

  @override
  void sendMessage(
          {required final String eventName,
          required final Map<String, dynamic> data}) =>
      socketConnectorModule.sendMessage(eventName: eventName, data: data);
  @override
  void disconnect() => socketConnectorModule.disconnect();
  @override
  void dispose() => socketConnectorModule.dispose();
}
