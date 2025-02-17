import 'package:json_annotation/json_annotation.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/models/core/base_model.dart';

import 'package:trend/core/utils/global.dart';

part 'primary_banner_model.g.dart';

@JsonSerializable()
class PrimaryBannerModel extends BaseModel {
  @JsonKey(name: 'image')
  final String? imageUrl;
  @JsonKey(defaultValue:Global.generateDefaultValue ? BannerType.advertisement:null)
  final BannerType bannerType;
  PrimaryBannerModel(
      {required super.id, required this.imageUrl, required this.bannerType});

  factory PrimaryBannerModel.fromJson(final Map<String, dynamic> data) =>
      _$PrimaryBannerModelFromJson(data);
}
