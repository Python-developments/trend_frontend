import 'package:json_annotation/json_annotation.dart';
import 'package:trend/data/models/products/filtering_variant_value_model.dart';

import 'package:trend/core/utils/global.dart';

part 'filtering_variant_key_model.g.dart';

@JsonSerializable()
class FilteringVariantKeyModel {
  @JsonKey(name: 'attributeShowName',defaultValue:Global.generateDefaultValue ? 'attribute':null)
  final String keyName;

  @JsonKey(name: 'values',defaultValue:Global.generateDefaultValue ? []:null)
  final List<FilteringVariantValueModel> variantValues;

  FilteringVariantKeyModel(
      {required this.keyName, required this.variantValues});

  factory FilteringVariantKeyModel.fromJson(final Map<String, dynamic> data) =>
      _$FilteringVariantKeyModelFromJson(data);
}
