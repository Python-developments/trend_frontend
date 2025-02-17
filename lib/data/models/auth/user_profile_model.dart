import 'package:json_annotation/json_annotation.dart';
import 'package:trend/core/utils/enums.dart';

import 'package:trend/core/utils/global.dart';

part 'user_profile_model.g.dart';

@JsonSerializable()
class UserProfileModel {
  final String name, email;

  UserProfileModel({
    required this.name,
    required this.email,
  });

  factory UserProfileModel.fromJson(final Map<String, dynamic> data) =>
      _$UserProfileModelFromJson(data);
  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);


}
