// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_settings_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AppSettingsModel _$AppSettingsModelFromJson(Map<String, dynamic> json) =>
    AppSettingsModel(
      facebook: json['facebook'] as String? ?? '',
      twitter: json['twitter'] as String? ?? '',
      tiktok: json['tiktok'] as String? ?? '',
      linkedIn: json['linkedIn'] as String? ?? '',
      youtube: json['youtube'] as String? ?? '',
      instagram: json['instagram'] as String? ?? '',
      androidMinimumVersion:
          json['androidMinimumVersion'] as String? ?? '0.0.1',
      androidCurrentVersion:
          json['androidCurrentVersion'] as String? ?? '0.0.1',
      iosMinimumVersion: json['iosMinimumVersion'] as String? ?? '0.0.1',
      iosCurrentVersion: json['iosCurrentVersion'] as String? ?? '0.0.1',
      isUnderMaintenance: json['wowvirAppUnderMaintenance'] as bool? ?? false,
    );

Map<String, dynamic> _$AppSettingsModelToJson(AppSettingsModel instance) =>
    <String, dynamic>{
      'androidMinimumVersion': instance.androidMinimumVersion,
      'androidCurrentVersion': instance.androidCurrentVersion,
      'iosMinimumVersion': instance.iosMinimumVersion,
      'iosCurrentVersion': instance.iosCurrentVersion,
      'facebook': instance.facebook,
      'twitter': instance.twitter,
      'tiktok': instance.tiktok,
      'linkedIn': instance.linkedIn,
      'youtube': instance.youtube,
      'instagram': instance.instagram,
      'wowvirAppUnderMaintenance': instance.isUnderMaintenance,
    };
