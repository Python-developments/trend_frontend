import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

part 'chatting_message_dto.g.dart';

@JsonSerializable()
class ChattingMessageDto {
  final String content;

  ChattingMessageDto({required this.content});

  factory ChattingMessageDto.fromImage({required final String imageId}) =>
      ChattingMessageDto(content: json.encode(imageId));

  Map<String, dynamic> toJson() => _$ChattingMessageDtoToJson(this);
}
