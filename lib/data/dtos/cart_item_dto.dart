import 'package:freezed_annotation/freezed_annotation.dart';

part 'cart_item_dto.g.dart';

@JsonSerializable()
class CartItemDto {
  @JsonKey(name: 'productItemPId')
  final String variantId;
  final int quantity;
  /*final Map<String,List<String>> additions;*/
  final String? notes;
  @JsonKey(name: 'customizationFile')
  final String? customImage;

  CartItemDto(
      {required this.quantity,
      /*required this.additions,*/ required this.notes,
      required this.customImage,
      required this.variantId});

  Map<String, dynamic> toJson() => _$CartItemDtoToJson(this);
}
