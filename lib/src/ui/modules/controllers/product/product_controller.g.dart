// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductController on ProductControllerBase, Store {
  Computed<int>? _$activeFoundsComputed;

  @override
  int get activeFounds =>
      (_$activeFoundsComputed ??= Computed<int>(() => super.activeFounds,
              name: 'ProductControllerBase.activeFounds'))
          .value;
  Computed<int>? _$inactiveFoundsComputed;

  @override
  int get inactiveFounds =>
      (_$inactiveFoundsComputed ??= Computed<int>(() => super.inactiveFounds,
              name: 'ProductControllerBase.inactiveFounds'))
          .value;
  Computed<bool>? _$isLoadingComputed;

  @override
  bool get isLoading =>
      (_$isLoadingComputed ??= Computed<bool>(() => super.isLoading,
              name: 'ProductControllerBase.isLoading'))
          .value;
  Computed<List<ProductDetailDto>?>? _$productsActiveComputed;

  @override
  List<ProductDetailDto>? get productsActive => (_$productsActiveComputed ??=
          Computed<List<ProductDetailDto>?>(() => super.productsActive,
              name: 'ProductControllerBase.productsActive'))
      .value;
  Computed<List<ProductDetailDto>?>? _$productsInactiveComputed;

  @override
  List<ProductDetailDto>? get productsInactive =>
      (_$productsInactiveComputed ??= Computed<List<ProductDetailDto>?>(
              () => super.productsInactive,
              name: 'ProductControllerBase.productsInactive'))
          .value;
  Computed<List<ProductDetailDto>?>? _$productsByStoreComputed;

  @override
  List<ProductDetailDto>? get productsByStore => (_$productsByStoreComputed ??=
          Computed<List<ProductDetailDto>?>(() => super.productsByStore,
              name: 'ProductControllerBase.productsByStore'))
      .value;

  @override
  String toString() {
    return '''
activeFounds: ${activeFounds},
inactiveFounds: ${inactiveFounds},
isLoading: ${isLoading},
productsActive: ${productsActive},
productsInactive: ${productsInactive},
productsByStore: ${productsByStore}
    ''';
  }
}
