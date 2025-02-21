import 'package:json_annotation/json_annotation.dart';
import 'package:trend/data/models/core/response_model.dart';

part 'pagination_response_model.g.dart';

@JsonSerializable()
class PaginationResponseModel extends ResponseModel {
  @JsonKey(name: 'count')
  final int totalItems;
  final List<dynamic> results;
  PaginationResponseModel({required this.totalItems, required this.results})
      : super(data: null);

  factory PaginationResponseModel.fromJson(
          {required final Map<String, dynamic> json}) =>
      _$PaginationResponseModelFromJson(json);
}
