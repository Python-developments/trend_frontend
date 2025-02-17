import 'dart:async';

import 'package:trend/third_parties_modules/abstract/i_module.dart';

abstract class ISocketConnectorModule extends IModule {
  StreamController<T> connect<T>(
      {required final String url,
      required final String path,
      required final Map<String, dynamic> headers,
      required final T Function(Map<String, dynamic>) messageFromJson,
          final void Function()? onConnectionInterruption
      });
  void sendMessage(
      {required final String eventName,
      required final Map<String, dynamic> data});
  void disconnect();
  bool get hasConnection;
}
