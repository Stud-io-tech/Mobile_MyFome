// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthViewModel on AuthViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'AuthViewModelBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$googleCredentialsAtom =
      Atom(name: 'AuthViewModelBase.googleCredentials', context: context);

  @override
  GoogleSignInAccount? get googleCredentials {
    _$googleCredentialsAtom.reportRead();
    return super.googleCredentials;
  }

  @override
  set googleCredentials(GoogleSignInAccount? value) {
    _$googleCredentialsAtom.reportWrite(value, super.googleCredentials, () {
      super.googleCredentials = value;
    });
  }

  late final _$userDetailDtoAtom =
      Atom(name: 'AuthViewModelBase.userDetailDto', context: context);

  @override
  UserDetailDto? get userDetailDto {
    _$userDetailDtoAtom.reportRead();
    return super.userDetailDto;
  }

  @override
  set userDetailDto(UserDetailDto? value) {
    _$userDetailDtoAtom.reportWrite(value, super.userDetailDto, () {
      super.userDetailDto = value;
    });
  }

  late final _$loginAsyncAction =
      AsyncAction('AuthViewModelBase.login', context: context);

  @override
  Future<dynamic> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$registerAsyncAction =
      AsyncAction('AuthViewModelBase.register', context: context);

  @override
  Future<dynamic> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$logoutAsyncAction =
      AsyncAction('AuthViewModelBase.logout', context: context);

  @override
  Future<dynamic> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$detailsAsyncAction =
      AsyncAction('AuthViewModelBase.details', context: context);

  @override
  Future<dynamic> details() {
    return _$detailsAsyncAction.run(() => super.details());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
googleCredentials: ${googleCredentials},
userDetailDto: ${userDetailDto}
    ''';
  }
}
