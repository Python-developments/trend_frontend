import 'package:trend/core/presentation/validators/custom_validator.dart';
import 'package:trend/data/errors/core_errors.dart';

class IsNumberValidator extends CustomValidator {
  final bool isDecimal;
  IsNumberValidator({required this.isDecimal, super.nextValidator});

  @override
  String? validate(
      {required final String fieldName, required final String? toCheckString}) {
    if (toCheckString == null ||
        (isDecimal && double.tryParse(toCheckString) == null) ||
        (!isDecimal && int.tryParse(toCheckString) == null)) {
      return IsNotNumberError(fieldName: fieldName).errorMessage;
    }
    return null;
  }
}
