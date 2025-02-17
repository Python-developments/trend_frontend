/*
import 'package:json_annotation/json_annotation.dart';

part 'chat_history_model.g.dart';

@JsonSerializable()
class ChatHistoryModel {

  final String lastMessage;
  final int? vendorId;
  final String? vendorName,vendorImageUrl;
  final DateTime lastMessageDate;

  ChatHistoryModel({required this.lastMessage,  required this.vendorName, required this.lastMessageDate, this.vendorId,this.vendorImageUrl});

  factory ChatHistoryModel.fromJson( final Map<String,dynamic> data)=>_$ChatHistoryModelFromJson(data);

  factory ChatHistoryModel.empty()=>ChatHistoryModel(lastMessage: 'lastMessage', vendorName: 'vendorName', lastMessageDate: DateTime.now());
}*/
