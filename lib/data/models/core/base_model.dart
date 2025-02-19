import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
abstract class BaseModel {
  final int id;

  BaseModel({required this.id});
}
