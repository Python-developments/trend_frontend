import 'package:json_annotation/json_annotation.dart';
import 'package:trend/data/models/core/response_model.dart';

part 'pagination_response_model.g.dart';

@JsonSerializable()
class PaginationResponseModel extends ResponseModel {
  final int totalItems;
  final List<dynamic> items;
  PaginationResponseModel({required this.totalItems, required this.items})
      : super(data: null);

  factory PaginationResponseModel.fromJson(
          {required final Map<String, dynamic> json}) =>
      _$PaginationResponseModelFromJson(json);
}
