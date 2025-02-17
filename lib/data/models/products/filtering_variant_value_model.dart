import 'package:json_annotation/json_annotation.dart';

import 'package:trend/core/utils/global.dart';

part 'filtering_variant_value_model.g.dart';

@JsonSerializable()
class FilteringVariantValueModel {
  @JsonKey(name: 'attributeValueId')
  final String id;

  @JsonKey(name: 'attributeValueName',defaultValue:Global.generateDefaultValue ? 'attribute value name':null)
  final String valueName;

  @JsonKey(name: 'attributeValueCount',defaultValue:Global.generateDefaultValue ? 0:null)
  final int matchedProductsCount;

  FilteringVariantValueModel(
      {required this.id,
      required this.valueName,
      required this.matchedProductsCount});

  factory FilteringVariantValueModel.fromJson(
          final Map<String, dynamic> data) =>
      _$FilteringVariantValueModelFromJson(data);
  Map<String, dynamic> toJson() => _$FilteringVariantValueModelToJson(this);
  factory FilteringVariantValueModel.empty() {
    return FilteringVariantValueModel(
      id: 'id',
      valueName: 'valueName',
      matchedProductsCount: 0,
    );
  }
}
