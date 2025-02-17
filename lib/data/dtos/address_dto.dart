import 'package:json_annotation/json_annotation.dart';
import 'package:trend/data/models/core/location_model.dart';

part 'address_dto.g.dart';

@JsonSerializable()
class AddressDto {
  final String title, area, addressDescription;
  final String? additionalInfo;
  final LocationModel location;

  AddressDto({
    required this.title,
    required this.area,
    required this.addressDescription,
    required this.additionalInfo,
    required this.location,
  });

  factory AddressDto.fromJson(final Map<String, dynamic> data) =>
      _$AddressDtoFromJson(data);

  Map<String, dynamic> toJson() => {
      'country': 'UAE',
    ..._$AddressDtoToJson(this)
  };

  factory AddressDto.empty() {
    return AddressDto(
      title: 'title',
      area: 'area',
      addressDescription: 'addressDescription',
      additionalInfo: 'additionalInfo',
      location: LocationModel(
        0.0,
        0.0,
      ),
    );
  }
}
