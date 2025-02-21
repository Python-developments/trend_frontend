import 'package:json_annotation/json_annotation.dart';
import 'package:trend/data/errors/core_errors.dart';
import 'package:trend/data/errors/custom_error.dart';

part 'api_error.g.dart';

@JsonSerializable()
class ApiError {
  @JsonKey(name: 'errors')
  final Map<String, List<String>>? validationErrors;
  @JsonKey(name: 'error')
  final String? apiErrorMessage;
  final String? message;

  ApiError({
    required this.validationErrors,
    required this.apiErrorMessage,
    required this.message,
  });

  factory ApiError.fromJson(final Map<String, dynamic> data) =>
      _$ApiErrorFromJson(data);

  CustomError  customError(final int statusCode) {
    return statusCode == 400
        ? BadRequestError(
            errorMessage: apiErrorMessage??message??'', validationErrors: validationErrors?.map(
          (final key, final value) => MapEntry(key, value.isNotEmpty ? value.first : ''),
    ))
        : statusCode == 401
            ? UnAuthorizedError()
            : statusCode == 403
                ? ForbiddenError()
                : statusCode == 404
                    ? NotFoundError(errorMessage: apiErrorMessage??message??'')
                    : statusCode == 422
                        ? UnProcessableEntityError(
                            errorMessage: apiErrorMessage??message??'')
                            : ServerError();
  }
}
