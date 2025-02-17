import 'package:trend/core/presentation/validators/custom_validator.dart';
import 'package:trend/data/errors/core_errors.dart';

class IsNameValidator extends CustomValidator {
  IsNameValidator({super.nextValidator});

  @override
  String? validate(
      {required final String fieldName, required final String? toCheckString}) {
    if ((toCheckString?.isEmpty ?? true) ||
        !RegExp(r'^[a-z A-Zأ-يءى-]*$').hasMatch(toCheckString ?? '')) {
      return IsNotNameError(fieldName: fieldName).errorMessage;
    }
    return null;
  }
}
