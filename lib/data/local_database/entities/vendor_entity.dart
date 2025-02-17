import 'package:trend/data/local_database/databases/concrete/app_local_database.dart';

class VendorEntity {
  final String id;
  final String name;
  final String? logoUrl;
  final String? coverUrl;
  final int reviewsCount;
  final String orderEstimationTime;
  final double rate;
  final double minimumOrderAmount;
  VendorEntity(
      {required this.id,
      required this.name,
      required this.reviewsCount,
      required this.orderEstimationTime,
      required this.rate,
      required this.minimumOrderAmount,
      this.logoUrl,
      this.coverUrl});

  factory VendorEntity.fromLocalVendor(final Vendor vendor) => VendorEntity(
      id: vendor.id,
      name: vendor.name,
      reviewsCount: vendor.reviewsCount,
      orderEstimationTime: vendor.orderEstimationTime,
      rate: vendor.rate,
      minimumOrderAmount: vendor.minimumOrderAmount,
      coverUrl: vendor.coverUrl,
      logoUrl: vendor.logoUrl);

  Vendor toLocalVendor() => Vendor(
      id: id,
      name: name,
      reviewsCount: reviewsCount,
      orderEstimationTime: orderEstimationTime,
      rate: rate,
      minimumOrderAmount: minimumOrderAmount,
      coverUrl: coverUrl,
      logoUrl: logoUrl);
}
