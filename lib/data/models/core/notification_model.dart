

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trend/data/models/core/base_model.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel extends BaseModel {
  final String target; // The user receiving the notification
  final String actor; // The user who performed the action
  final String verb; // Action performed (e.g., "liked your post")
  final bool isRead; // Indicates whether the notification has been read
  final bool isFollowing; // Indicates if the actor is following the target
  final DateTime createdAt; // Time when the notification was created
  final String avatar;
  final int idActor;

  NotificationModel({
    required super.id,
    required this.target,
    required this.actor,
    required this.verb,
    required this.idActor,
    required this.isRead,
    required this.isFollowing,
    required this.createdAt,
    required this.avatar,
  });


  factory NotificationModel.fromJson(final Map<String, dynamic> data) => _$NotificationModelFromJson(data);

  Map<String, dynamic> toJson() => _$NotificationModelToJson(this);
}
// }
//   }
