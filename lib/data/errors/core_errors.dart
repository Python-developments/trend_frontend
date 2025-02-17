import 'package:trend/core/presentation/assets.dart';
import 'package:trend/core/utils/extensions.dart';
import 'package:trend/data/errors/custom_error.dart';

class InternetConnectionError extends CustomError {
  InternetConnectionError()
      : super(
            errorMessage: 'It seems you are not connected to the internet',
            subtitle: 'Please check your connection and try again',
            errorImage: Assets.internetEmptyView);
}

class SomethingWentWrongError extends CustomError {
  SomethingWentWrongError()
      : super(
            errorMessage: 'Something went wrong , please try again later',
            subtitle: null,
            errorImage: Assets.serverEmptyView);
}

class ServerError extends CustomError {
  ServerError()
      : super(
          errorMessage: 'Oops! We are sorry for this experience',
          errorImage: Assets.serverEmptyView,
        );
}

class ForbiddenError extends CustomError {
  ForbiddenError()
      : super(
            errorMessage: 'You are not allowed to access this page',
            errorImage: Assets.wowvir);
}

class UnSupportedLocationError extends CustomError {
  UnSupportedLocationError()
      : super(
            errorMessage:
                'Unfortunately, our services are currently unavailable in your area.',
            errorImage: Assets.addressesEmptyView);
}

class NotFoundError extends CustomError {
  NotFoundError({required super.errorMessage})
      : super(errorImage: Assets.wowvir);
}

class BadRequestError extends CustomError {
  final Map<String, String>? validationErrors;
  BadRequestError({required this.validationErrors, required super.errorMessage})
      : super(
          errorImage: Assets.wowvir,
        );
}

class UnProcessableEntityError extends CustomError {
  UnProcessableEntityError({required super.errorMessage})
      : super(
          errorImage: Assets.wowvir,
        );
}

class UnAuthorizedError extends CustomError {
  UnAuthorizedError()
      : super(
            errorMessage: 'Oops! It seems you\'re not registered',
            subtitle: 'Register and get exciting offers',
            errorImage: Assets.authorizationEmptyView);
}

class IsNotBiggerThanError extends CustomError {
  IsNotBiggerThanError(
      {required final String fieldName, required final num number})
      : super(
            errorMessage:
                "${fieldName} ${"should be bigger than"} $number",
            errorImage: null);
}

class IsNotSmallerThanError extends CustomError {
  IsNotSmallerThanError(
      {required final String fieldName, required final num number})
      : super(
            errorMessage:
                "${fieldName} ${"should be smaller than"} $number",
            errorImage: null);
}

class IsNotNameError extends CustomError {
  IsNotNameError({required final String fieldName})
      : super(
            errorMessage:
                "${fieldName} ${"is not a valid name"}",
            errorImage: null);
}

class IsNotNumberError extends CustomError {
  IsNotNumberError({required final String fieldName})
      : super(
            errorMessage:
                "${fieldName} ${"is not a valid number"}",
            errorImage: null);
}

class EmptyFieldError extends CustomError {
  EmptyFieldError({required final String fieldName})
      : super(
            errorMessage:
                "${fieldName} ${"should not be empty"}",
            errorImage: null);
}

class ShorterThanError extends CustomError {
  ShorterThanError(
      {required final String fieldName, required final int minLength})
      : super(
            errorMessage:
                "${fieldName} ${"should be with length"} $minLength",
            errorImage: null);
}

class IsNotSelectedError extends CustomError {
  IsNotSelectedError({required final String fieldName})
      : super(
            errorMessage:
                "${"Please select"} ${fieldName}",
            errorImage: null);
}
