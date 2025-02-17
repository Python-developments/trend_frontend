// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'complaint_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ComplaintDto _$ComplaintDtoFromJson(Map<String, dynamic> json) => ComplaintDto(
      reasonId: json['tag'] as String,
      notes: json['text'] as String?,
      imageId: json['image'] as String?,
    );

Map<String, dynamic> _$ComplaintDtoToJson(ComplaintDto instance) =>
    <String, dynamic>{
      'tag': instance.reasonId,
      'text': instance.notes,
      'image': instance.imageId,
    };
