
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trend/data/models/auth/user_profile_model.dart';
import 'package:trend/data/models/core/base_model.dart';

part 'user_info_model.g.dart';

@JsonSerializable()
class UserInfoModel extends BaseModel {
  final String username;
  final String email;
  final String? fullName;
  final String? avatar;
  final int followers;
  final int following;
  final int totalPosts;
  final int totalLikes;
  final UserProfileModel profile;

  UserInfoModel({
    required super.id,
    required this.username,
    required this.email,
    required this.followers, required this.following, required this.totalPosts, required this.totalLikes, required this.profile, this.fullName,
    this.avatar,
  });

  factory UserInfoModel.fromJson(final Map<String, dynamic> data) =>
      _$UserInfoModelFromJson(data);
  Map<String, dynamic> toJson() => _$UserInfoModelToJson(this);
}