import 'package:json_annotation/json_annotation.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/models/core/base_model.dart';
import 'package:trend/data/models/core/location_model.dart';
import 'package:trend/data/models/vendors/vendor_category_model.dart';

import 'package:trend/core/utils/global.dart';

part 'vendor_details_model.g.dart';

@JsonSerializable()
class VendorDetailsModel extends BaseModel {
  @JsonKey(name: 'rating',defaultValue:Global.generateDefaultValue ? 5.0:null)
  final double rate;

  @JsonKey(name: 'shopName' ,defaultValue:Global.generateDefaultValue ? 'Vendor Name':null)
  final String vendorName;

  final LocationModel location;
  final String? openTime, closeTime;
  @JsonKey(defaultValue:Global.generateDefaultValue ? 1:null)
  final int totalReviews;
  @JsonKey(name: 'status',defaultValue:Global.generateDefaultValue ? VendorStatus.OPEN:null)
  final VendorStatus vendorStatus;

  @JsonKey(name: 'shopCategories',defaultValue:Global.generateDefaultValue ? []:null)
  final List<VendorCategoryModel> vendorCategories;

  VendorDetailsModel(
      {required super.id,
      required this.rate,
      required this.closeTime,
      required this.vendorStatus,
      required this.location,
      required this.vendorName,
      required this.openTime,
      required this.vendorCategories,
      required this.totalReviews});

  factory VendorDetailsModel.fromJson(final Map<String, dynamic> data) =>
      _$VendorDetailsModelFromJson(data);
}
