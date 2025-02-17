import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
abstract class BaseModel {
  @JsonKey(name: '_id')
  final String id;

  BaseModel({required this.id});
}
