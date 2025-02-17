import 'package:json_annotation/json_annotation.dart';
import 'package:trend/core/utils/global.dart';
import 'package:trend/data/models/core/base_model.dart';

part 'brand_model.g.dart';

@JsonSerializable()
class BrandModel extends BaseModel {

  @JsonKey(defaultValue:Global.generateDefaultValue ? 'name':null)
  final String name;

  BrandModel({required super.id, required this.name});

  factory BrandModel.fromJson(final Map<String, dynamic> data) =>
      _$BrandModelFromJson(data);
  factory BrandModel.empty() {
    return BrandModel(
      id: '',
      name: 'name',
    );
  }
}
