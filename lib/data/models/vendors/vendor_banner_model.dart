import 'package:json_annotation/json_annotation.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/models/vendors/vendor_model.dart';

import 'package:trend/core/utils/global.dart';

part 'vendor_banner_model.g.dart';

@JsonSerializable()
class VendorBannerModel {
  @JsonKey(defaultValue:Global.generateDefaultValue ? '':null)
  final String title;
  @JsonKey(name: 'shops',defaultValue:Global.generateDefaultValue ? []:null)
  final List<VendorModel> vendors;
  @JsonKey(name: 'type',defaultValue:Global.generateDefaultValue ? VendorBannerType.shopCoverImage:null)
  final VendorBannerType bannerType;

  VendorBannerModel(
      {required this.title, required this.vendors, required this.bannerType});

  factory VendorBannerModel.fromJson(final Map<String, dynamic> data) =>
      _$VendorBannerModelFromJson(data);

  factory VendorBannerModel.empty() => VendorBannerModel(
      title: 'title',
      bannerType: VendorBannerType.shopCoverImage,
      vendors: List.generate(5, (final _) => VendorModel.empty()));
}
