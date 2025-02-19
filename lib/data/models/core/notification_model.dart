import 'package:json_annotation/json_annotation.dart';
import 'package:trend/data/models/core/base_model.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel extends BaseModel {
  final String title, body;
  final DateTime createdAt;

  NotificationModel({
    required super.id,
    required this.title,
    required this.body,
    required this.createdAt,
  });

  factory NotificationModel.fromJson(final Map<String, dynamic> data) =>
      _$NotificationModelFromJson(data);
}
