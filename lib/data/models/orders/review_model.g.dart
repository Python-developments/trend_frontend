// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'review_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReviewModel _$ReviewModelFromJson(Map<String, dynamic> json) => ReviewModel(
      rate: (json['rating'] as num?)?.toInt() ?? 5,
      username: json['customer'] as String? ?? '',
      createdAt: json['createdAt'] == null
          ? Global.defaultDateTime()
          : DateTime.parse(json['createdAt'] as String),
      comment: json['comment'] as String?,
    );

Map<String, dynamic> _$ReviewModelToJson(ReviewModel instance) =>
    <String, dynamic>{
      'rating': instance.rate,
      'customer': instance.username,
      'comment': instance.comment,
      'createdAt': instance.createdAt.toIso8601String(),
    };
