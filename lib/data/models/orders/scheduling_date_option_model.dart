import 'package:json_annotation/json_annotation.dart';
import 'package:trend/core/utils/global.dart';

part 'scheduling_date_option_model.g.dart';

@JsonSerializable()
class SchedulingDateOptionModel {
  @JsonKey(defaultValue: Global.generateDefaultValue ? Global.defaultDateTime:null)
  final DateTime from, to;

  SchedulingDateOptionModel({required this.from, required this.to});

  factory SchedulingDateOptionModel.fromJson(final Map<String, dynamic> data) =>
      _$SchedulingDateOptionModelFromJson(data);
}
