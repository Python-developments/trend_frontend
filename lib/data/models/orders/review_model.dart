import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trend/core/utils/global.dart';

part 'review_model.g.dart';

@JsonSerializable()
class ReviewModel {
  @JsonKey(name: 'rating',defaultValue: Global.generateDefaultValue ? 5:null)
  final int rate;
  @JsonKey(name: 'customer',defaultValue: Global.generateDefaultValue ? '':null)
  final String username;
  final String? comment;
  @JsonKey(defaultValue: Global.generateDefaultValue ? Global.defaultDateTime:null)
  final DateTime createdAt;

  ReviewModel(
      {required this.rate,
      required this.username,
      required this.createdAt,
      this.comment});

  factory ReviewModel.fromJson(final Map<String, dynamic> data) =>
      _$ReviewModelFromJson(data);
  Map<String, dynamic> toJson() => _$ReviewModelToJson(this);

  factory ReviewModel.empty() =>
      ReviewModel(rate: 2, username: ' username', createdAt: DateTime.now());
}
