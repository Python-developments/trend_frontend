import 'dart:async';
import 'package:injectable/injectable.dart';

import 'package:socket_io_client/socket_io_client.dart';
import 'package:trend/third_parties_modules/abstract/i_socket_connector_module.dart';

@Singleton(as: ISocketConnectorModule)
class SocketConnectorModule extends ISocketConnectorModule {
  late Socket socket;
  @override
  StreamController<T> connect<T>(
      {required final String url,
      required final String path,
      required final Map<String, dynamic> headers,
      required final T Function(Map<String, dynamic> data) messageFromJson,
       final void Function()? onConnectionInterruption}) {
    final StreamController<T> result = StreamController();
    try {
      socket = io(
          url,
          OptionBuilder()
              .setTransports(['websocket'])
              .setPath(path)
              .setExtraHeaders(headers)
              .build());
      socket.onConnect((final _) {
        isConnected=true;
        socket.emit('join');
      });
      socket.onConnectError((final data) {
        isConnected=false;
        onConnectionInterruption?.call();
      });
      socket.onDisconnect((final data) {
        isConnected=false;
        onConnectionInterruption?.call();
      });
      socket.onAny((final String eventName, final dynamic message) {
        try {
          final Map<String, dynamic> mapMessage =
              message as Map<String, dynamic>;
          final T newMessage =
              messageFromJson({'event': eventName, ...mapMessage});
          result.sink.add(newMessage);
        } catch (e) {}
      });

      socket.connect();
    } catch (e) {}

    return result;
  }

  @override
  void sendMessage(
      {required final String eventName,
      required final Map<String, dynamic> data}) {
    socket.emit(eventName, data);
  }

  @override
  void disconnect() {
    socket.close();
  }

  bool isConnected = false;
  @override
  bool get hasConnection => isConnected;

  @override
  @disposeMethod
  void dispose() {
    socket.dispose();
  }
}
