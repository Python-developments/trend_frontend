import 'package:trend/core/presentation/validators/custom_validator.dart';
import 'package:trend/data/errors/core_errors.dart';

class IsNotEmptyValidator extends CustomValidator {
  IsNotEmptyValidator({super.nextValidator});

  @override
  String? validate(
      {required final String fieldName, required final String? toCheckString}) {
    if (toCheckString == null || toCheckString.isEmpty) {
      return EmptyFieldError(fieldName: fieldName).errorMessage;
    }
    return null;
  }
}
