import 'package:json_annotation/json_annotation.dart';

import 'package:trend/core/utils/global.dart';

part 'variant_value_key_id_model.g.dart';

@JsonSerializable()
class VariantValueKeyIdModel {
  @JsonKey(name: 'name',defaultValue:Global.generateDefaultValue ?'name':null)
  final String valueName;
  @JsonKey(name: 'attributeId')
  final String keyId;

  VariantValueKeyIdModel({required this.valueName, required this.keyId});

  factory VariantValueKeyIdModel.fromJson(final Map<String, dynamic> data) =>
      _$VariantValueKeyIdModelFromJson(data);
  Map<String, dynamic> toJson() => _$VariantValueKeyIdModelToJson(this);

  factory VariantValueKeyIdModel.empty() =>
      VariantValueKeyIdModel(valueName: 'valueName', keyId: 'keyId');
}
