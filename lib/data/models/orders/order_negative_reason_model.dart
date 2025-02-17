import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trend/core/utils/global.dart';
import 'package:trend/data/models/core/base_model.dart';

part 'order_negative_reason_model.g.dart';

@JsonSerializable()
class OrderNegativeReasonModel extends BaseModel {
  @JsonKey(defaultValue: Global.generateDefaultValue ? '':null)
  final String title;
  @JsonKey(name: 'requiresImage',defaultValue: Global.generateDefaultValue ? false:null)
  final bool needImage;
  @JsonKey(name: 'convertToComplain' ,defaultValue: Global.generateDefaultValue ? false:null)
  final bool isComplaintReason;

  OrderNegativeReasonModel(
      {required this.title,
      required super.id,
      required this.needImage,
      required this.isComplaintReason});

  factory OrderNegativeReasonModel.fromJson(final Map<String, dynamic> data) =>
      _$OrderNegativeReasonModelFromJson(data);
}
