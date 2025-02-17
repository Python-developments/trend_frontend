import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';
import 'package:trend/core/controllers/base_controller.dart';
import 'package:trend/data/errors/core_errors.dart';

mixin FormMixin on BaseController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  Future<void> submitFunction();
  Future<void> afterSuccessSubmitting();

  void initForm(final Map<String, String?>? initialValues) {
    if (initialValues == null) {
      return;
    }
    initialValues.forEach((final key, final value) {
      _textControllers[key] = TextEditingController(text: value);
    });
    _textControllers.forEach((final key, final value) {});
  }

  @observable
  final ObservableMap<String, TextEditingController> _textControllers =
      ObservableMap();

  @observable
  ObservableMap<String, String> validationErrors = ObservableMap();
  @action
  void setValue(final String key, final String? value) =>
      getFieldTextController(key).text = value ?? '';

  @computed
  bool get canSubmit => formKey.currentState!.validate();

  @computed
  Map<String, String?> get _currentValues =>
      _textControllers.map((final key, final value) =>
          MapEntry(key, value.text.isEmpty ? null : value.text));

  @computed
  String? valueOf(final String key) => _currentValues[key];

  TextEditingController getFieldTextController(final String fieldKey) {
    if (_textControllers[fieldKey] == null) {
      _textControllers[fieldKey] = TextEditingController();
    }
    return _textControllers[fieldKey]!;
  }

  @action
  Future<void> submitForm() => runStoreSecondaryFunction(() async {
        if (isLoading || !canSubmit) {
          return;
        }

        formKey.currentState!.save();
        validationErrors = ObservableMap();
        isLoading = true;

        await submitFunction();
        isLoading = false;

        await afterSuccessSubmitting();
      }, onCatchError: (final e) {
        isLoading = false;
        if (e is BadRequestError) {
          validationErrors = ObservableMap.of(e.validationErrors ?? {});
        }
      });

  @override
  void dispose() {
    for (TextEditingController element in _textControllers.values) {
      element.dispose();
    }
  }
}
