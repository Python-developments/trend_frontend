// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'pagination_response_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PaginationResponseModel _$PaginationResponseModelFromJson(
        Map<String, dynamic> json) =>
    PaginationResponseModel(
      totalItems: (json['totalItems'] as num).toInt(),
      items: json['items'] as List<dynamic>,
    );

Map<String, dynamic> _$PaginationResponseModelToJson(
        PaginationResponseModel instance) =>
    <String, dynamic>{
      'totalItems': instance.totalItems,
      'items': instance.items,
    };
