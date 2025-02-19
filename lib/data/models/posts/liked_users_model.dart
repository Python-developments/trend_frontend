import 'package:json_annotation/json_annotation.dart';

part 'liked_users_model.g.dart';

@JsonSerializable()
class LikedUsersModel {
  final int id;
  final String username;

  LikedUsersModel({
    required this.id,
    required this.username,
  });

  factory LikedUsersModel.fromJson(final Map<String, dynamic> json) => _$LikedUsersModelFromJson(json);
  Map<String, dynamic> toJson() => _$LikedUsersModelToJson(this);
}