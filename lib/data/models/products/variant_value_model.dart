import 'package:json_annotation/json_annotation.dart';

import 'package:trend/core/utils/global.dart';

part 'variant_value_model.g.dart';

@JsonSerializable()
class VariantValueModel {
  @JsonKey(name: 'name',defaultValue:Global.generateDefaultValue ?'name':null)
  final String valueName;

  VariantValueModel({
    required this.valueName,
  });

  factory VariantValueModel.fromJson(final Map<String, dynamic> data) =>
      _$VariantValueModelFromJson(data);
  Map<String, dynamic> toJson() => _$VariantValueModelToJson(this);

  factory VariantValueModel.empty() => VariantValueModel(
        valueName: 'valueName',
      );
}
