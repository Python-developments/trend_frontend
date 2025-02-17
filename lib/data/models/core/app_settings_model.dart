import 'dart:io';
import 'package:json_annotation/json_annotation.dart';
import 'package:trend/core/utils/enums.dart';

import 'package:trend/core/utils/global.dart';
import 'package:trend/dependencies.dart';
import 'package:trend/third_parties_modules/abstract/i_native_device_store_module.dart';

part 'app_settings_model.g.dart';

@JsonSerializable()
class AppSettingsModel {
  @JsonKey(defaultValue:Global.generateDefaultValue ? '0.0.1':null)
  final String androidMinimumVersion,
      androidCurrentVersion,
      iosMinimumVersion,
      iosCurrentVersion;
  @JsonKey(defaultValue:Global.generateDefaultValue ? '':null)
  final String
      facebook,
      twitter,
      tiktok,
      linkedIn,
      youtube,
      instagram;
     @JsonKey(name:'wowvirAppUnderMaintenance',defaultValue:Global.generateDefaultValue ? false:null)
       bool isUnderMaintenance;

  AppSettingsModel({
    required this.facebook,
    required this.twitter,
    required this.tiktok,
    required this.linkedIn,
    required this.youtube,
    required this.instagram,
    required this.androidMinimumVersion,
    required this.androidCurrentVersion,
    required this.iosMinimumVersion,
    required this.iosCurrentVersion,
    required this.isUnderMaintenance
  });

  factory AppSettingsModel.fromJson(final Map<String, dynamic> data) =>
      _$AppSettingsModelFromJson(data);

  Future<ApplicationState> get applicationState async{
    final String  currentVersion = await getIt<INativeDeviceStoreModule>().currentAppVersion;

    return currentVersion.compareTo(
                  Platform.isIOS ? iosMinimumVersion : androidMinimumVersion) <
          0
      ? ApplicationState.mustUpdate
      : currentVersion.compareTo(
                  Platform.isIOS ? iosCurrentVersion : androidCurrentVersion) <
              0
          ? ApplicationState.canUpdate
          : ApplicationState.stable;
  }

  factory AppSettingsModel.empty() {
    return AppSettingsModel(
      facebook: 'facebook',
      twitter: 'twitter',
      tiktok: 'tiktok',
      linkedIn: 'linkedIn',
      youtube: 'youtube',
      instagram: 'instagram',
      androidMinimumVersion: 'androidMinimumVersion',
      androidCurrentVersion: 'androidCurrentVersion',
      iosMinimumVersion: 'iosMinimumVersion',
      iosCurrentVersion: 'iosCurrentVersion',
      isUnderMaintenance: false
    );
  }
}
