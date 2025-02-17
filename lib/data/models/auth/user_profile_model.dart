import 'package:json_annotation/json_annotation.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/models/address_model.dart';

import 'package:trend/core/utils/global.dart';

part 'user_profile_model.g.dart';

@JsonSerializable()
class UserProfileModel {
  @JsonKey(defaultValue: Global.generateDefaultValue ? '':null)
  final String name, email;
  @JsonKey(defaultValue: Global.generateDefaultValue ? 'ref':null)
  final String referralCode;
  @JsonKey(defaultValue: Global.generateDefaultValue ? 'en':null)
  final String  language;


  @JsonKey(name: 'DOB')
  final DateTime? birthday;
  final String? phoneNumber;
  @JsonKey(name: 'lastOrderNotRated')
  final String? lastUnratedOrderId;
  @JsonKey(name: 'gender')
  final GenderType? genderType;
  @JsonKey(defaultValue: Global.generateDefaultValue ? false:null)
  final bool isPhoneVerified, isEmailVerified, isSocialLogin;
  @JsonKey(defaultValue: Global.generateDefaultValue ? []:null)
  final List<AddressModel> addresses;

  UserProfileModel({
    required this.name,
    required this.email,
    required this.referralCode,
    required this.isSocialLogin,
    required this.isPhoneVerified,
    required this.isEmailVerified,
    required this.lastUnratedOrderId,
    required this.language,
    required this.addresses,
    this.birthday,
    this.phoneNumber,
    this.genderType,
  });

  factory UserProfileModel.fromJson(final Map<String, dynamic> data) =>
      _$UserProfileModelFromJson(data);
  Map<String, dynamic> toJson() => _$UserProfileModelToJson(this);

  factory UserProfileModel.empty() => UserProfileModel(
        name: 'name',
        lastUnratedOrderId: null,
        email: 'email',
        referralCode: 'referralCode',
        isSocialLogin: false,
        language: 'en',
        isPhoneVerified: true,
        isEmailVerified: true,
        addresses: [],
      );
}
