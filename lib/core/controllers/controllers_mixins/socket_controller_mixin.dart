


import 'dart:async';

import 'package:mobx/mobx.dart';
import 'package:trend/core/controllers/base_controller.dart';
import 'package:trend/data/clients/concrete/web_socket_client.dart';


mixin SocketControllerMixin<T> on BaseController{


  late WebSocketClient<T> webSocketClient;
  Future<void> onMessageReceived(final T message);


  @action
  void initConnection({required final WebSocketClient<T> client,required final Map<String,dynamic> headers,}){
    if(hasInitializedBefore) {
      return;
    }
    hasInitializedBefore=true;
    webSocketClient=client..connect(headers:headers,).stream
        .listen((final T message) async{
      await onMessageReceived(message);
    });
  }

  @observable
  T? streamingMessage;


  bool get isSocketConnecting=>hasInitializedBefore? webSocketClient.hasConnection:false;

  bool hasInitializedBefore=false;


  @action
  void disconnect(){
    hasInitializedBefore=false;
    webSocketClient.disconnect();
  }



  @override
  void dispose() {
    webSocketClient.dispose();
    super.dispose();
  }
}