// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'support_request_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SupportRequestDto _$SupportRequestDtoFromJson(Map<String, dynamic> json) =>
    SupportRequestDto(
      name: json['name'] as String,
      email: json['email'] as String,
      phoneNumber: json['phoneNumber'] as String,
      message: json['content'] as String,
      supportRequestType:
          $enumDecode(_$SupportRequestTypeEnumMap, json['subject']),
    );

Map<String, dynamic> _$SupportRequestDtoToJson(SupportRequestDto instance) =>
    <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'phoneNumber': instance.phoneNumber,
      'content': instance.message,
      'subject': _$SupportRequestTypeEnumMap[instance.supportRequestType]!,
    };

const _$SupportRequestTypeEnumMap = {
  SupportRequestType.account: 'account',
  SupportRequestType.order: 'order',
  SupportRequestType.payment: 'payment',
  SupportRequestType.delivery: 'delivery',
  SupportRequestType.technical: 'technical',
  SupportRequestType.others: 'others',
};
