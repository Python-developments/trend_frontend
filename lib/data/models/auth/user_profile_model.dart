import 'package:json_annotation/json_annotation.dart';

part 'user_profile_model.g.dart';

@JsonSerializable()
class UserProfileModel {
  final String? bio;
  final String? mobile;
  final bool isPrivate;
  final bool verified;
  final bool isBusiness;
  final bool isSuspended;

  UserProfileModel({
    required this.isPrivate, required this.verified, required this.isBusiness, required this.isSuspended, this.bio,
    this.mobile,
  });

  factory UserProfileModel.fromJson(final Map<String, dynamic> data) =>
      _$UserProfileModelFromJson(data);
  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);
}

