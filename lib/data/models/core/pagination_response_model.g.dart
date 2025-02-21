// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationResponseModel _$PaginationResponseModelFromJson(
        Map<String, dynamic> json) =>
    PaginationResponseModel(
      totalItems: (json['count'] as num).toInt(),
      results: json['results'] as List<dynamic>,
    );

Map<String, dynamic> _$PaginationResponseModelToJson(
        PaginationResponseModel instance) =>
    <String, dynamic>{
      'count': instance.totalItems,
      'results': instance.results,
    };
