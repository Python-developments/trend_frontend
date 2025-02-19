// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'confirm_otp_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ConfirmOtpController on ConfirmOtpControllerBase, Store {
  late final _$resendSecondsCounterAtom = Atom(
      name: 'ConfirmOtpControllerBase.resendSecondsCounter', context: context);

  @override
  int get resendSecondsCounter {
    _$resendSecondsCounterAtom.reportRead();
    return super.resendSecondsCounter;
  }

  @override
  set resendSecondsCounter(int value) {
    _$resendSecondsCounterAtom.reportWrite(value, super.resendSecondsCounter,
        () {
      super.resendSecondsCounter = value;
    });
  }

  late final _$ConfirmOtpControllerBaseActionController =
      ActionController(name: 'ConfirmOtpControllerBase', context: context);

  @override
  void changeOtpCode(String newCode) {
    final _$actionInfo = _$ConfirmOtpControllerBaseActionController.startAction(
        name: 'ConfirmOtpControllerBase.changeOtpCode');
    try {
      return super.changeOtpCode(newCode);
    } finally {
      _$ConfirmOtpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void resendCode() {
    final _$actionInfo = _$ConfirmOtpControllerBaseActionController.startAction(
        name: 'ConfirmOtpControllerBase.resendCode');
    try {
      return super.resendCode();
    } finally {
      _$ConfirmOtpControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
resendSecondsCounter: ${resendSecondsCounter}
    ''';
  }
}
