import 'package:trend/core/presentation/snake_bars/snack_bar_messages.dart';
import 'package:trend/data/errors/custom_error.dart';

class CartNewChangesError extends CustomError {
  CartNewChangesError()
      : super(errorMessage: SnakeBarMessages.newCartChanges, errorImage: null);
}

class PaymentFailedError extends CustomError {
  PaymentFailedError()
      : super(
            errorMessage: 'Failed to pay , please try again', errorImage: null);
}

class AddNewPaymentCardError extends CustomError {
  AddNewPaymentCardError()
      : super(
            errorMessage:
                'Failed to add the card , please recheck the fields and retry',
            errorImage: null);
}
