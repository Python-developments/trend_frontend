import 'package:json_annotation/json_annotation.dart';

part 'join_as_vendor_dto.g.dart';

@JsonSerializable()
class JoinAsVendorDto {
  final String vendorName, contactName, email, phoneNumber, location;

  @JsonKey(name: 'mainCategory')
  final String categoryId;



  JoinAsVendorDto(
      {required this.vendorName,
      required this.contactName,
      required this.email,
      required this.phoneNumber,
      required this.location,
      required this.categoryId,
      });

  factory JoinAsVendorDto.fromJson(final Map<String, dynamic> data) =>
      _$JoinAsVendorDtoFromJson(data);

  Map<String, dynamic> toJson() => _$JoinAsVendorDtoToJson(this);

  factory JoinAsVendorDto.empty() {
    return JoinAsVendorDto(
        vendorName: 'vendorName',
        contactName: 'contactName',
        email: 'email',
        phoneNumber: 'phoneNumber',
        location: 'location',
        categoryId: 'categoryId',
        );
  }
}
