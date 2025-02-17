import 'package:json_annotation/json_annotation.dart';
import 'package:trend/core/utils/enums.dart';
import 'package:trend/data/models/core/base_model.dart';
import 'package:trend/data/models/cart/cart_item_model.dart';

import 'package:trend/core/utils/global.dart';

part 'cart_model.g.dart';

@JsonSerializable()
class CartModel extends BaseModel {
  @JsonKey(defaultValue:Global.generateDefaultValue ? []:null)
  final List<CartItemModel> items;
  @JsonKey(name: 'minimumOrderAmount',defaultValue:Global.generateDefaultValue ? 250.00:null)
  //Null in case on items
  final double minimumOrderValue;
  @JsonKey(name: 'shopId')
  final String? vendorId;
  @JsonKey(defaultValue:Global.generateDefaultValue ? Global.defaultDateTime:null)
  final DateTime startSchedulingDate;

  @JsonKey(name: 'availableFulfillmentMethods',
      defaultValue:Global.generateDefaultValue ? []:null)
  final List<OrderType> allowedOrderTypes;

  @JsonKey(name: 'acceptCOD',
      defaultValue:Global.generateDefaultValue ? false:null)
  final bool allowCashOnDelivery;
  @JsonKey(name: 'shopStatus')
  final VendorStatus? vendorStatus;
  @JsonKey(name: 'shopName')
  final String? vendorName;
  CartModel(
      {required this.items,
      required this.vendorId,
      required this.vendorStatus,
      required this.allowedOrderTypes,
      required this.allowCashOnDelivery,
      required super.id,
      required this.vendorName,
      required this.minimumOrderValue,
      required this.startSchedulingDate});
  factory CartModel.fromJson(final Map<String, dynamic> data) =>
      _$CartModelFromJson(data);

  @override
  bool operator ==(covariant final CartModel other) {
    if (vendorStatus != other.vendorStatus) {
      return false;
    }
    if (items.length != other.items.length) {
      return false;
    }

    for (int i = 0; i < items.length; i++) {
      if (!items[i].isEqual(other.items[i])) {
        return false;
      }
    }
    return true;
  }
}
