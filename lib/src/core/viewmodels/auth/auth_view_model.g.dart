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

  late final _$idUserAtom =
      Atom(name: 'AuthViewModelBase.idUser', context: context);

  @override
  String? get idUser {
    _$idUserAtom.reportRead();
    return super.idUser;
  }

  @override
  set idUser(String? value) {
    _$idUserAtom.reportWrite(value, super.idUser, () {
      super.idUser = value;
    });
  }

  late final _$idUserLoadAsyncAction =
      AsyncAction('AuthViewModelBase.idUserLoad', context: context);

  @override
  Future<void> idUserLoad() {
    return _$idUserLoadAsyncAction.run(() => super.idUserLoad());
  }

  late final _$loginAsyncAction =
      AsyncAction('AuthViewModelBase.login', context: context);

  @override
  Future<void> login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$registerAsyncAction =
      AsyncAction('AuthViewModelBase.register', context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$logoutAsyncAction =
      AsyncAction('AuthViewModelBase.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
googleCredentials: ${googleCredentials},
idUser: ${idUser}
    ''';
  }
}
