import 'package:json_annotation/json_annotation.dart';
import 'package:trend/core/utils/global.dart';
import 'package:trend/data/models/core/base_model.dart';

part 'short_vendor_model.g.dart';

@JsonSerializable()
class ShortVendorModel extends BaseModel {
  @JsonKey(name: 'shopName',defaultValue:Global.generateDefaultValue ? 'Shop Name':null)
  final String name;
  @JsonKey(defaultValue:Global.generateDefaultValue ? 'slug':null)
  final String slug;
  ShortVendorModel({required super.id, required this.name, required this.slug});
  factory ShortVendorModel.fromJson(final Map<String, dynamic> json) =>
      _$ShortVendorModelFromJson(json);

  Map<String, dynamic> toJson() => _$ShortVendorModelToJson(this);
  factory ShortVendorModel.empty() =>
      ShortVendorModel(id: 'id', name: 'name', slug: 'slug');
}
