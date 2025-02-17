import 'package:trend/data/errors/custom_error.dart';

class NotReadTermsAndConditionError extends CustomError {
  NotReadTermsAndConditionError()
      : super(
            errorMessage:
                'Please read our terms and conditions and accept it before registering',
            errorImage: null);
}

class PasswordDoesntMatchConfirmError extends CustomError {
  PasswordDoesntMatchConfirmError()
      : super(
            errorMessage: 'Password and confirm password are not matched',
            errorImage: null);
}
