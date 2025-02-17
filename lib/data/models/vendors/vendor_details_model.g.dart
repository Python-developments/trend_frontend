// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'vendor_details_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

VendorDetailsModel _$VendorDetailsModelFromJson(Map<String, dynamic> json) =>
    VendorDetailsModel(
      id: json['_id'] as String,
      rate: (json['rating'] as num?)?.toDouble() ?? 5.0,
      closeTime: json['closeTime'] as String?,
      vendorStatus:
          $enumDecodeNullable(_$VendorStatusEnumMap, json['status']) ??
              VendorStatus.OPEN,
      location:
          LocationModel.fromJson(json['location'] as Map<String, dynamic>),
      vendorName: json['shopName'] as String? ?? 'Vendor Name',
      openTime: json['openTime'] as String?,
      vendorCategories: (json['shopCategories'] as List<dynamic>?)
              ?.map((e) =>
                  VendorCategoryModel.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      totalReviews: (json['totalReviews'] as num?)?.toInt() ?? 1,
    );

Map<String, dynamic> _$VendorDetailsModelToJson(VendorDetailsModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'rating': instance.rate,
      'shopName': instance.vendorName,
      'location': instance.location.toJson(),
      'openTime': instance.openTime,
      'closeTime': instance.closeTime,
      'totalReviews': instance.totalReviews,
      'status': _$VendorStatusEnumMap[instance.vendorStatus]!,
      'shopCategories':
          instance.vendorCategories.map((e) => e.toJson()).toList(),
    };

const _$VendorStatusEnumMap = {
  VendorStatus.OPEN: 'OPEN',
  VendorStatus.CLOSED: 'CLOSED',
  VendorStatus.BUSY_30_MIN: 'BUSY_30_MIN',
  VendorStatus.BUSY_60_MIN: 'BUSY_60_MIN',
};
