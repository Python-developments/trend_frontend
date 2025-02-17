// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'primary_banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

PrimaryBannerModel _$PrimaryBannerModelFromJson(Map<String, dynamic> json) =>
    PrimaryBannerModel(
      id: json['_id'] as String,
      imageUrl: json['image'] as String?,
      bannerType:
          $enumDecodeNullable(_$BannerTypeEnumMap, json['bannerType']) ??
              BannerType.advertisement,
    );

Map<String, dynamic> _$PrimaryBannerModelToJson(PrimaryBannerModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'image': instance.imageUrl,
      'bannerType': _$BannerTypeEnumMap[instance.bannerType]!,
    };

const _$BannerTypeEnumMap = {
  BannerType.shopList: 'ShopList',
  BannerType.advertisement: 'Advertisement',
};
