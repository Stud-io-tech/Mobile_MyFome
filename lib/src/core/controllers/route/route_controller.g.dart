// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$RouteController on RouteControllerBase, Store {
  late final _$routeAtom =
      Atom(name: 'RouteControllerBase.route', context: context);

  @override
  String? get route {
    _$routeAtom.reportRead();
    return super.route;
  }

  @override
  set route(String? value) {
    _$routeAtom.reportWrite(value, super.route, () {
      super.route = value;
    });
  }

  late final _$routeGetAsyncAction =
      AsyncAction('RouteControllerBase.routeGet', context: context);

  @override
  Future routeGet() {
    return _$routeGetAsyncAction.run(() => super.routeGet());
  }

  late final _$routeUpdateAsyncAction =
      AsyncAction('RouteControllerBase.routeUpdate', context: context);

  @override
  Future routeUpdate(String value) {
    return _$routeUpdateAsyncAction.run(() => super.routeUpdate(value));
  }

  late final _$routeCleanAsyncAction =
      AsyncAction('RouteControllerBase.routeClean', context: context);

  @override
  Future routeClean() {
    return _$routeCleanAsyncAction.run(() => super.routeClean());
  }

  @override
  String toString() {
    return '''
route: ${route}
    ''';
  }
}
