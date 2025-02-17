// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorModel _$VendorModelFromJson(Map<String, dynamic> json) => VendorModel(
      id: json['_id'] as String,
      reviewsCount: (json['totalReviews'] as num?)?.toInt() ?? 1,
      vendorStatus:
          $enumDecodeNullable(_$VendorStatusEnumMap, json['status']) ??
              VendorStatus.OPEN,
      minimumOrderAmount: json['minimumOrderAmount'] as num? ?? 200.0,
      orderEstimationTime:
          json['expectedDeliveryTime'] as String? ?? '40 minutes',
      logoUrl: json['logo'] as String?,
      coverUrl: json['cover'] as String?,
      name: json['shopName'] as String? ?? 'Shop Name',
      rate: (json['rating'] as num?)?.toDouble() ?? 5.0,
      originalLogoUrl: json['originalLogo'] as String?,
    );

Map<String, dynamic> _$VendorModelToJson(VendorModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'totalReviews': instance.reviewsCount,
      'logo': instance.logoUrl,
      'originalLogo': instance.originalLogoUrl,
      'cover': instance.coverUrl,
      'shopName': instance.name,
      'expectedDeliveryTime': instance.orderEstimationTime,
      'minimumOrderAmount': instance.minimumOrderAmount,
      'rating': instance.rate,
      'status': _$VendorStatusEnumMap[instance.vendorStatus]!,
    };

const _$VendorStatusEnumMap = {
  VendorStatus.OPEN: 'OPEN',
  VendorStatus.CLOSED: 'CLOSED',
  VendorStatus.BUSY_30_MIN: 'BUSY_30_MIN',
  VendorStatus.BUSY_60_MIN: 'BUSY_60_MIN',
};
