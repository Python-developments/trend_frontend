import 'package:json_annotation/json_annotation.dart';

part 'tokens_model.g.dart';

@JsonSerializable()
class TokensModel {
  @JsonKey(name: 'refresh')
  final String refreshToken;

  @JsonKey(name: 'access')
  final String accessToken;

  TokensModel({
    required this.refreshToken,
    required this.accessToken,
  });

  factory TokensModel.fromJson(final Map<String, dynamic> json) => _$TokensModelFromJson(json);

  Map<String, dynamic> toJson() => _$TokensModelToJson(this);
}