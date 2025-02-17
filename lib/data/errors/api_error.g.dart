// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ApiError _$ApiErrorFromJson(Map<String, dynamic> json) => ApiError(
      statusCode: (json['code'] as num).toInt(),
      validationErrors: (json['fields'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(k, e as String),
      ),
      apiErrorMessage: json['message'] as String,
    );

Map<String, dynamic> _$ApiErrorToJson(ApiError instance) => <String, dynamic>{
      'code': instance.statusCode,
      'fields': instance.validationErrors,
      'message': instance.apiErrorMessage,
    };
