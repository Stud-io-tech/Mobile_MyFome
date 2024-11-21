// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on AuthControllerBase, Store {
  Computed<String?>? _$idUserComputed;

  @override
  String? get idUser =>
      (_$idUserComputed ??= Computed<String?>(() => super.idUser,
              name: 'AuthControllerBase.idUser'))
          .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'AuthControllerBase.isLoading'))
          .value;

  late final _$loginAsyncAction =
      AsyncAction('AuthControllerBase.login', context: context);

  @override
  Future login() {
    return _$loginAsyncAction.run(() => super.login());
  }

  late final _$logoutAsyncAction =
      AsyncAction('AuthControllerBase.logout', context: context);

  @override
  Future logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$accessTokenLoadAsyncAction =
      AsyncAction('AuthControllerBase.accessTokenLoad', context: context);

  @override
  Future accessTokenLoad() {
    return _$accessTokenLoadAsyncAction.run(() => super.accessTokenLoad());
  }

  @override
  String toString() {
    return '''
idUser: ${idUser},
isLoading: ${isLoading}
    ''';
  }
}
