import 'package:trend/core/presentation/validators/custom_validator.dart';
import 'package:trend/core/presentation/validators/is_bigger_than_validator.dart';
import 'package:trend/core/presentation/validators/is_smaller_than_validator.dart';

class IsBetweenRangeValidator extends CustomValidator {
  final num? minimumNumber, maximumNumber;

  IsBetweenRangeValidator(
      {required this.minimumNumber,
      required this.maximumNumber,
      super.nextValidator});

  @override
  String? validate(
      {required final String fieldName, required final String? toCheckString}) {
    if (minimumNumber != null) {
      IsBiggerThanValidator(toCompare: minimumNumber!, allowEquality: true)
          .validate(fieldName: fieldName, toCheckString: toCheckString);
    }
    if (maximumNumber != null) {
      IsSmallerThanValidator(toCompare: maximumNumber!, allowEquality: true)
          .validate(fieldName: fieldName, toCheckString: toCheckString);
    }
    return null;
  }
}
