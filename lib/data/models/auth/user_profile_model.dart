import 'package:json_annotation/json_annotation.dart';

import 'package:trend/data/models/core/base_model.dart';

part 'user_profile_model.g.dart';

@JsonSerializable()
class UserProfileModel extends BaseModel {

  final String username;
  final String email;
  final String? fullName;
  final String? avatar;
  final String? bio;
  final String? mobile;
  final int followers;
  final int following;
  final int totalPosts;
  final int totalLikes;
  final bool isPrivate;

  UserProfileModel({
    required super.id,
    required this.username,
    required this.email,
    required this.fullName,
    required this.avatar,
    required this.bio,
    required this.mobile,
    required this.followers,
    required this.following,
    required this.totalPosts,
    required this.totalLikes,
    required this.isPrivate,
  });

  factory UserProfileModel.fromJson(final Map<String, dynamic> data) =>
      _$UserProfileModelFromJson(data);
  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);


}
