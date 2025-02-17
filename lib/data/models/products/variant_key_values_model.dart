import 'package:json_annotation/json_annotation.dart';
import 'package:trend/data/models/core/base_model.dart';

import 'package:trend/data/models/products/variant_value_model.dart';

import 'package:trend/core/utils/global.dart';

part 'variant_key_values_model.g.dart';

@JsonSerializable()
class VariantKeyValuesModel extends BaseModel {
  @JsonKey(name: 'showName',defaultValue:Global.generateDefaultValue ?'name':null)
  final String keyName;
  @JsonKey(defaultValue:Global.generateDefaultValue ?[]:null)
  final List<VariantValueModel> values;

  VariantKeyValuesModel(
      {required super.id, required this.keyName, required this.values});

  factory VariantKeyValuesModel.fromJson(final Map<String, dynamic> data) =>
      _$VariantKeyValuesModelFromJson(data);
  Map<String, dynamic> toJson() => _$VariantKeyValuesModelToJson(this);
}
