// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_category_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductCategoryController on ProductCategoryControllerBase, Store {
  Computed<ProductCategoryPageDto?>? _$productListPageComputed;

  @override
  ProductCategoryPageDto? get productListPage => (_$productListPageComputed ??=
          Computed<ProductCategoryPageDto?>(() => super.productListPage,
              name: 'ProductCategoryControllerBase.productListPage'))
      .value;

  late final _$initAsyncAction =
      AsyncAction('ProductCategoryControllerBase.init', context: context);

  @override
  Future init() {
    return _$initAsyncAction.run(() => super.init());
  }

  @override
  String toString() {
    return '''
productListPage: ${productListPage}
    ''';
  }
}
