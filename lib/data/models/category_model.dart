import 'package:json_annotation/json_annotation.dart';
import 'package:trend/core/utils/global.dart';
import 'package:trend/data/models/core/base_model.dart';
import 'package:trend/data/models/core/file_response_model.dart';

part 'category_model.g.dart';

@JsonSerializable()
class CategoryModel extends BaseModel {
  @JsonKey(defaultValue:Global.generateDefaultValue ? '':null)
  final String name, slug;
  @JsonKey(name: 'logo')
  final FileResponseModel? imageUrl;
  @JsonKey(name: 'position')
  final int? order;

  CategoryModel({
    required super.id,
    required this.name,
    required this.slug,
    required this.order,
    this.imageUrl,
  });

  factory CategoryModel.fromJson(final Map<String, dynamic> data) =>
      _$CategoryModelFromJson(data);

  Map<String, dynamic> toJson() => _$CategoryModelToJson(this);
  factory CategoryModel.empty() {
    return CategoryModel(
      id: '',
      order: 1,
      name: 'name',
      slug: 'slug',
      imageUrl: FileResponseModel.empty(),
    );
  }
}
