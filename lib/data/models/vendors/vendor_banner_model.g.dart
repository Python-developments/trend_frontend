// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_banner_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorBannerModel _$VendorBannerModelFromJson(Map<String, dynamic> json) =>
    VendorBannerModel(
      title: json['title'] as String? ?? '',
      vendors: (json['shops'] as List<dynamic>?)
              ?.map((e) => VendorModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      bannerType:
          $enumDecodeNullable(_$VendorBannerTypeEnumMap, json['type']) ??
              VendorBannerType.shopCoverImage,
    );

Map<String, dynamic> _$VendorBannerModelToJson(VendorBannerModel instance) =>
    <String, dynamic>{
      'title': instance.title,
      'shops': instance.vendors.map((e) => e.toJson()).toList(),
      'type': _$VendorBannerTypeEnumMap[instance.bannerType]!,
    };

const _$VendorBannerTypeEnumMap = {
  VendorBannerType.shopCoverImage: 'shopCoverImage',
  VendorBannerType.shopOriginalLogo: 'shopOriginalLogo',
};
