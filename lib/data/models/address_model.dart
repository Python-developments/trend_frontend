import 'package:json_annotation/json_annotation.dart';
import 'package:trend/data/models/core/base_model.dart';
import 'package:trend/data/models/core/location_model.dart';

import 'package:trend/core/utils/global.dart';

part 'address_model.g.dart';

@JsonSerializable()
class AddressModel extends BaseModel {
  @JsonKey(defaultValue:Global.generateDefaultValue ? '':null)
  final String title, area, addressDescription;
  final String? additionalInfo;
  final LocationModel location;

  AddressModel({
    required super.id,
    required this.title,
    required this.area,
    required this.additionalInfo,
    required this.addressDescription,
    required this.location,
  });

  factory AddressModel.fromJson(final Map<String, dynamic> data) =>
      _$AddressModelFromJson(data);
  Map<String, dynamic> toJson() => _$AddressModelToJson(this);

  factory AddressModel.empty() {
    return AddressModel(
      id: 'id',
      title: 'title',
      area: 'area',
      additionalInfo: 'additionalInfo',
      addressDescription: 'addressDescription',
      location: LocationModel.empty(),
    );
  }
}
