import 'package:json_annotation/json_annotation.dart';
import 'package:trend/data/models/core/base_model.dart';

part 'file_response_model.g.dart';

@JsonSerializable()
class FileResponseModel extends BaseModel {
  final String? url;

  FileResponseModel({
    required super.id,
    required this.url,
  });
  factory FileResponseModel.fromJson(final Map<String, dynamic> data) =>
      _$FileResponseModelFromJson(data);
  Map<String, dynamic> toJson() => _$FileResponseModelToJson(this);
  factory FileResponseModel.empty() {
    return FileResponseModel(
      id: '',
      url: 'url',
    );
  }
}
