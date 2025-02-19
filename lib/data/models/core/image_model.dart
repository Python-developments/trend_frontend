import 'package:json_annotation/json_annotation.dart';

part 'image_model.g.dart';

@JsonSerializable()
class ImageModel  {
  @JsonKey(name: 'imgUrl')
  final String? url;

  ImageModel({required this.url});

  factory ImageModel.fromJson(final Map<String, dynamic> data) => _$ImageModelFromJson(data);

  Map<String, dynamic> toJson() => _$ImageModelToJson(this);
}
