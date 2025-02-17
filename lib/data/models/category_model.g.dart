// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryModel _$CategoryModelFromJson(Map<String, dynamic> json) =>
    CategoryModel(
      id: json['_id'] as String,
      name: json['name'] as String? ?? '',
      slug: json['slug'] as String? ?? '',
      order: (json['position'] as num?)?.toInt(),
      imageUrl: json['logo'] == null
          ? null
          : FileResponseModel.fromJson(json['logo'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CategoryModelToJson(CategoryModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'name': instance.name,
      'slug': instance.slug,
      'logo': instance.imageUrl?.toJson(),
      'position': instance.order,
    };
