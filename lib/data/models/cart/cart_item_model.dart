import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:trend/data/models/cart/cart_product_model.dart';
import 'package:trend/data/models/core/file_response_model.dart';

part 'cart_item_model.freezed.dart';
part 'cart_item_model.g.dart';

@freezed
class CartItemModel with _$CartItemModel {
  const CartItemModel._();
  factory CartItemModel({
    @JsonKey(name: '_id') required final String id,
    required final CartProductModel product,
    required final int quantity,
    final String? notes,
    @JsonKey(name: 'customizationFile') final FileResponseModel? customImage,

    /*required final List<AdditionsListModel> additions,*/
  }) = _CartItemModel;

  factory CartItemModel.fromJson(final Map<String, dynamic> data) =>
      _$CartItemModelFromJson(data);

  double get totalPrice =>
      (product.discountPrice ?? product.originalPrice) *
      quantity; /*additions.fold(0,
          (final previousValue, final element) => previousValue+element.options.fold(0,
                  (final previousValue,final option) => option.price+previousValue));*/

  bool isEqual(covariant final CartItemModel other) =>
      product == other.product && quantity == other.quantity;
  factory CartItemModel.empty() => CartItemModel(
        id: '',
        product: CartProductModel.empty(),
        quantity: 0,
        notes: 'notes',
      );
}
