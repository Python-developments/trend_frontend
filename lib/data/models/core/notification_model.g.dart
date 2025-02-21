// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'notification_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

NotificationModel _$NotificationModelFromJson(Map<String, dynamic> json) =>
    NotificationModel(
      id: (json['id'] as num).toInt(),
      target: json['target'] as String,
      actor: json['actor'] as String,
      verb: json['verb'] as String,
      idActor: (json['id_actor'] as num).toInt(),
      isRead: json['is_read'] as bool,
      isFollowing: json['is_following'] as bool,
      createdAt: DateTime.parse(json['created_at'] as String),
      avatar: json['avatar'] as String,
    );

Map<String, dynamic> _$NotificationModelToJson(NotificationModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'target': instance.target,
      'actor': instance.actor,
      'verb': instance.verb,
      'is_read': instance.isRead,
      'is_following': instance.isFollowing,
      'created_at': instance.createdAt.toIso8601String(),
      'avatar': instance.avatar,
      'id_actor': instance.idActor,
    };
