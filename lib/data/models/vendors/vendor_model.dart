import 'package:json_annotation/json_annotation.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/local_database/entities/vendor_entity.dart';
import 'package:trend/data/models/core/base_model.dart';

import 'package:trend/core/utils/global.dart';

part 'vendor_model.g.dart';

@JsonSerializable()
class VendorModel extends BaseModel {
  @JsonKey(name: 'totalReviews',defaultValue:Global.generateDefaultValue ? 1:null)
  final int reviewsCount;

  @JsonKey(name: 'logo')
  final String? logoUrl;

  @JsonKey(name: 'originalLogo')
  final String? originalLogoUrl;
  @JsonKey(name: 'cover')
  final String? coverUrl;
  @JsonKey(name: 'shopName',defaultValue:Global.generateDefaultValue ? 'Shop Name':null)
  final String name;
  @JsonKey(name: 'expectedDeliveryTime',defaultValue:Global.generateDefaultValue ? '40 minutes':null)
  final String orderEstimationTime;
  @JsonKey(defaultValue:Global.generateDefaultValue ? 200.00:null)
  final num minimumOrderAmount;
  @JsonKey(name: 'rating',defaultValue:Global.generateDefaultValue ? 5.00:null)
  final double rate;
  @JsonKey(name: 'status',defaultValue:Global.generateDefaultValue ? VendorStatus.OPEN:null)
  final VendorStatus vendorStatus;

  VendorModel(
      {
      required super.id,
      required this.reviewsCount,
      required this.vendorStatus,
      required this.minimumOrderAmount,
      required this.orderEstimationTime,
      required this.logoUrl,
      required this.coverUrl,
      required this.name,
      required this.rate,
      this.originalLogoUrl});

  factory VendorModel.fromJson(final Map<String, dynamic> data) =>
      _$VendorModelFromJson(data);

  factory VendorModel.fromCache(final VendorEntity vendor) => VendorModel(
      id: vendor.id,
      reviewsCount: vendor.reviewsCount,
      vendorStatus: VendorStatus.OPEN,
      orderEstimationTime: vendor.orderEstimationTime,
      logoUrl: vendor.logoUrl,
      coverUrl: vendor.coverUrl,
      name: vendor.name,
      minimumOrderAmount: vendor.minimumOrderAmount,
      rate: vendor.rate);
  Map<String, dynamic> toJson() => _$VendorModelToJson(this);

  factory VendorModel.empty() => VendorModel(
      id: ' id',
      reviewsCount: 5,
      vendorStatus: VendorStatus.CLOSED,
      minimumOrderAmount: 12,
      orderEstimationTime: ' orderEstimationTime',
      logoUrl: ' logoUrl',
      coverUrl: ' coverUrl',
      name: ' name',
      rate: 2);
}
