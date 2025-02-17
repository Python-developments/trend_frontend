import 'package:trend/core/presentation/validators/custom_validator.dart';
import 'package:trend/data/errors/core_errors.dart';

class IsBiggerThanValidator extends CustomValidator {
  final num toCompare;
  final bool allowEquality;
  IsBiggerThanValidator(
      {required this.toCompare,
      required this.allowEquality,
      super.nextValidator});

  @override
  String? validate(
      {required final String fieldName, required final String? toCheckString}) {
    if (toCheckString != null &&
        (num.parse(toCheckString) > toCompare ||
            (num.parse(toCheckString) == toCompare && allowEquality))) {
      return null;
    }
    return IsNotBiggerThanError(fieldName: fieldName, number: toCompare)
        .errorMessage;
  }
}
