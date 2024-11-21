// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'institute_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$InstituteController on InstituteControllerBase, Store {
  Computed<InstitutePageDto?>? _$instituteListPageComputed;

  @override
  InstitutePageDto? get instituteListPage => (_$instituteListPageComputed ??=
          Computed<InstitutePageDto?>(() => super.instituteListPage,
              name: 'InstituteControllerBase.instituteListPage'))
      .value;

  late final _$initAsyncAction =
      AsyncAction('InstituteControllerBase.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  @override
  String toString() {
    return '''
instituteListPage: ${instituteListPage}
    ''';
  }
}
