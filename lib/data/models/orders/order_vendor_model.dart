import 'package:json_annotation/json_annotation.dart';
import 'package:trend/core/utils/global.dart';
import 'package:trend/data/models/core/file_response_model.dart';
import 'package:trend/data/models/core/location_model.dart';

part 'order_vendor_model.g.dart';

@JsonSerializable()
class OrderVendorModel {
  @JsonKey(name: 'shopName',defaultValue: Global.generateDefaultValue ? '':null)
  final String vendorName;
  final LocationModel location;
  @JsonKey(name: 'originalLogo')
  final FileResponseModel? vendorLogo;

  OrderVendorModel(
      {required this.vendorName,
      required this.location,
      required this.vendorLogo});

  factory OrderVendorModel.fromJson(final Map<String, dynamic> data) =>
      _$OrderVendorModelFromJson(data);
  Map<String, dynamic> toJson() => _$OrderVendorModelToJson(this);

  factory OrderVendorModel.empty() => OrderVendorModel(
    vendorName: '',
    location: LocationModel.empty(),
    vendorLogo: null,
  );
}
