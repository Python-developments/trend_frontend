// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on AuthControllerBase, Store {
  late final _$userProfileModelAtom =
      Atom(name: 'AuthControllerBase.userProfileModel', context: context);

  @override
  UserProfileModel? get userProfileModel {
    _$userProfileModelAtom.reportRead();
    return super.userProfileModel;
  }

  @override
  set userProfileModel(UserProfileModel? value) {
    _$userProfileModelAtom.reportWrite(value, super.userProfileModel, () {
      super.userProfileModel = value;
    });
  }

  late final _$cachedUserAtom =
      Atom(name: 'AuthControllerBase.cachedUser', context: context);

  @override
  UserEntity? get cachedUser {
    _$cachedUserAtom.reportRead();
    return super.cachedUser;
  }

  @override
  set cachedUser(UserEntity? value) {
    _$cachedUserAtom.reportWrite(value, super.cachedUser, () {
      super.cachedUser = value;
    });
  }

  late final _$getUserProfileAsyncAction =
      AsyncAction('AuthControllerBase.getUserProfile', context: context);

  @override
  Future<void> getUserProfile() {
    return _$getUserProfileAsyncAction.run(() => super.getUserProfile());
  }

  late final _$loginAsyncAction =
      AsyncAction('AuthControllerBase.login', context: context);

  @override
  Future<void> login({required LoginDto loginDto}) {
    return _$loginAsyncAction.run(() => super.login(loginDto: loginDto));
  }

  late final _$registerAsyncAction =
      AsyncAction('AuthControllerBase.register', context: context);

  @override
  Future<void> register(RegisterDto registerDto) {
    return _$registerAsyncAction.run(() => super.register(registerDto));
  }

  late final _$AuthControllerBaseActionController =
      ActionController(name: 'AuthControllerBase', context: context);

  @override
  Future<void> loadData() {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.loadData');
    try {
      return super.loadData();
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> _refreshProfile() {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase._refreshProfile');
    try {
      return super._refreshProfile();
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> logout() {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.logout');
    try {
      return super.logout();
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> deleteAccount() {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.deleteAccount');
    try {
      return super.deleteAccount();
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> changePassword() {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.changePassword');
    try {
      return super.changePassword();
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void loginAsGuest() {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.loginAsGuest');
    try {
      return super.loginAsGuest();
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  Future<void> updateProfile({required UpdateProfileDto updateProfileDto}) {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.updateProfile');
    try {
      return super.updateProfile(updateProfileDto: updateProfileDto);
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
userProfileModel: ${userProfileModel},
cachedUser: ${cachedUser}
    ''';
  }
}
