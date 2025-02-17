// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'current_location_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$CurrentLocationController on CurrentLocationControllerBase, Store {
  Computed<(LocationModel, String?)>? _$userApplicationSurfingLocationComputed;

  @override
  (LocationModel, String?) get userApplicationSurfingLocation =>
      (_$userApplicationSurfingLocationComputed ??= Computed<
                  (LocationModel, String?)>(
              () => super.userApplicationSurfingLocation,
              name:
                  'CurrentLocationControllerBase.userApplicationSurfingLocation'))
          .value;

  late final _$currentLocationAtom = Atom(
      name: 'CurrentLocationControllerBase.currentLocation', context: context);

  @override
  LocationModel? get currentLocation {
    _$currentLocationAtom.reportRead();
    return super.currentLocation;
  }

  @override
  set currentLocation(LocationModel? value) {
    _$currentLocationAtom.reportWrite(value, super.currentLocation, () {
      super.currentLocation = value;
    });
  }

  late final _$selectedLocationAtom = Atom(
      name: 'CurrentLocationControllerBase.selectedLocation', context: context);

  @override
  LocationModel? get selectedLocation {
    _$selectedLocationAtom.reportRead();
    return super.selectedLocation;
  }

  @override
  set selectedLocation(LocationModel? value) {
    _$selectedLocationAtom.reportWrite(value, super.selectedLocation, () {
      super.selectedLocation = value;
    });
  }

  late final _$selectedAddressAtom = Atom(
      name: 'CurrentLocationControllerBase.selectedAddress', context: context);

  @override
  AddressModel? get selectedAddress {
    _$selectedAddressAtom.reportRead();
    return super.selectedAddress;
  }

  @override
  set selectedAddress(AddressModel? value) {
    _$selectedAddressAtom.reportWrite(value, super.selectedAddress, () {
      super.selectedAddress = value;
    });
  }

  late final _$currentLocationStringAtom = Atom(
      name: 'CurrentLocationControllerBase.currentLocationString',
      context: context);

  @override
  String? get currentLocationString {
    _$currentLocationStringAtom.reportRead();
    return super.currentLocationString;
  }

  @override
  set currentLocationString(String? value) {
    _$currentLocationStringAtom.reportWrite(value, super.currentLocationString,
        () {
      super.currentLocationString = value;
    });
  }

  late final _$addressStringAtom = Atom(
      name: 'CurrentLocationControllerBase.addressString', context: context);

  @override
  String? get addressString {
    _$addressStringAtom.reportRead();
    return super.addressString;
  }

  @override
  set addressString(String? value) {
    _$addressStringAtom.reportWrite(value, super.addressString, () {
      super.addressString = value;
    });
  }

  late final _$CurrentLocationControllerBaseActionController =
      ActionController(name: 'CurrentLocationControllerBase', context: context);

  @override
  Future<void> getCurrentLocation() {
    final _$actionInfo = _$CurrentLocationControllerBaseActionController
        .startAction(name: 'CurrentLocationControllerBase.getCurrentLocation');
    try {
      return super.getCurrentLocation();
    } finally {
      _$CurrentLocationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSelectedLocation(
      LocationModel newLocation, String? newAddressString) {
    final _$actionInfo =
        _$CurrentLocationControllerBaseActionController.startAction(
            name: 'CurrentLocationControllerBase.changeSelectedLocation');
    try {
      return super.changeSelectedLocation(newLocation, newAddressString);
    } finally {
      _$CurrentLocationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void changeSelectedAddress(AddressModel newAddress) {
    final _$actionInfo =
        _$CurrentLocationControllerBaseActionController.startAction(
            name: 'CurrentLocationControllerBase.changeSelectedAddress');
    try {
      return super.changeSelectedAddress(newAddress);
    } finally {
      _$CurrentLocationControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
currentLocation: ${currentLocation},
selectedLocation: ${selectedLocation},
selectedAddress: ${selectedAddress},
currentLocationString: ${currentLocationString},
addressString: ${addressString},
userApplicationSurfingLocation: ${userApplicationSurfingLocation}
    ''';
  }
}
