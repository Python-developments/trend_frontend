import 'package:freezed_annotation/freezed_annotation.dart';

part 'addition_item_model.freezed.dart';
part 'addition_item_model.g.dart';

@freezed
class AdditionItemModel with _$AdditionItemModel {
  factory AdditionItemModel(
      {required final String id,
      required final String name,
      required final double price}) = _AdditionItemModel;

  factory AdditionItemModel.fromJson(final Map<String, dynamic> data) =>
      _$AdditionItemModelFromJson(data);
}
