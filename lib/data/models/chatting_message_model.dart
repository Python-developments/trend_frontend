/*

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trend/data/models/core/file_response_model.dart';
import 'package:trend/data/models/socket_message_model.dart';

part 'chatting_message_model.freezed.dart';
part 'chatting_message_model.g.dart';

@Freezed(unionKey: 'type')
class ChattingMessageModel extends SocketMessageModel with _$ChattingMessageModel{


  @FreezedUnionValue('text')
  factory ChattingMessageModel.textMessage({
    required final String content,
    required final bool isUserMessage,
    required final DateTime createdAt,
      })=TextMessage;

  @FreezedUnionValue('image')
  factory ChattingMessageModel.imageMessage({
    required final FileResponseModel image,
    required final bool isUserMessage,
    required final DateTime createdAt,
      })=ImageMessage;


  factory ChattingMessageModel.fromJson( final Map<String,dynamic> data)=>_$ChattingMessageModelFromJson(data);

  factory ChattingMessageModel.empty()=>ChattingMessageModel.textMessage(content: 'content', isUserMessage: false, createdAt: DateTime.now());


}
*/
