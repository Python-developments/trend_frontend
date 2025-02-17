import 'package:json_annotation/json_annotation.dart';
import 'package:trend/data/models/core/base_model.dart';
import 'package:trend/data/models/core/notification_data_model.dart';

import 'package:trend/core/utils/global.dart';

part 'notification_model.g.dart';

@JsonSerializable()
class NotificationModel extends BaseModel {
  @JsonKey(defaultValue:Global.generateDefaultValue ? '':null)
  final String title, body;
  @JsonKey(defaultValue:Global.generateDefaultValue ? Global.defaultDateTime:null)
  final DateTime createdAt;
  final NotificationDataModel data;
  NotificationModel({
    required super.id,
    required this.title,
    required this.body,
    required this.createdAt,
    required this.data,
  });

  factory NotificationModel.fromJson(final Map<String, dynamic> data) =>
      _$NotificationModelFromJson(data);
}
