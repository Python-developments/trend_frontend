import 'dart:async';

import 'package:trend/third_parties_modules/abstract/i_socket_connector_module.dart';

abstract class IWebSocketClient<T> {
  final ISocketConnectorModule socketConnectorModule;
  IWebSocketClient(this.socketConnectorModule);
  StreamController<T> connect({required final Map<String, dynamic> headers,final void Function()?onConnectionInterruption});
  bool get hasConnection;

  void sendMessage(
      {required final String eventName,
      required final Map<String, dynamic> data});
  T messageFromJson(final Map<String, dynamic> data);
  void disconnect();
  void dispose();
}

