import 'package:trend/core/presentation/validators/custom_validator.dart';
import 'package:trend/data/errors/core_errors.dart';

class IsShorterThanValidator extends CustomValidator {
  final int minLength;
  IsShorterThanValidator({required this.minLength, super.nextValidator});

  @override
  String? validate(
      {required final String fieldName, required final String? toCheckString}) {
    if (toCheckString == null || toCheckString.length < minLength) {
      return EmptyFieldError(fieldName: fieldName).errorMessage;
    }
    return null;
  }
}
