// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_view_model.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProductViewModel on ProductViewModelBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'ProductViewModelBase.isLoading', context: context);

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

  late final _$productsListActiveAtom =
      Atom(name: 'ProductViewModelBase.productsListActive', context: context);

  @override
  List<ProductDetailDto>? get productsListActive {
    _$productsListActiveAtom.reportRead();
    return super.productsListActive;
  }

  @override
  set productsListActive(List<ProductDetailDto>? value) {
    _$productsListActiveAtom.reportWrite(value, super.productsListActive, () {
      super.productsListActive = value;
    });
  }

  late final _$productsListInactiveAtom =
      Atom(name: 'ProductViewModelBase.productsListInactive', context: context);

  @override
  List<ProductDetailDto>? get productsListInactive {
    _$productsListInactiveAtom.reportRead();
    return super.productsListInactive;
  }

  @override
  set productsListInactive(List<ProductDetailDto>? value) {
    _$productsListInactiveAtom.reportWrite(value, super.productsListInactive,
        () {
      super.productsListInactive = value;
    });
  }

  late final _$productFilterListActiveAtom = Atom(
      name: 'ProductViewModelBase.productFilterListActive', context: context);

  @override
  List<ProductDetailDto>? get productFilterListActive {
    _$productFilterListActiveAtom.reportRead();
    return super.productFilterListActive;
  }

  @override
  set productFilterListActive(List<ProductDetailDto>? value) {
    _$productFilterListActiveAtom
        .reportWrite(value, super.productFilterListActive, () {
      super.productFilterListActive = value;
    });
  }

  late final _$productFilterListInactiveAtom = Atom(
      name: 'ProductViewModelBase.productFilterListInactive', context: context);

  @override
  List<ProductDetailDto>? get productFilterListInactive {
    _$productFilterListInactiveAtom.reportRead();
    return super.productFilterListInactive;
  }

  @override
  set productFilterListInactive(List<ProductDetailDto>? value) {
    _$productFilterListInactiveAtom
        .reportWrite(value, super.productFilterListInactive, () {
      super.productFilterListInactive = value;
    });
  }

  late final _$productsByStoreAtom =
      Atom(name: 'ProductViewModelBase.productsByStore', context: context);

  @override
  List<ProductDetailDto>? get productsByStore {
    _$productsByStoreAtom.reportRead();
    return super.productsByStore;
  }

  @override
  set productsByStore(List<ProductDetailDto>? value) {
    _$productsByStoreAtom.reportWrite(value, super.productsByStore, () {
      super.productsByStore = value;
    });
  }

  late final _$activeFoundsAtom =
      Atom(name: 'ProductViewModelBase.activeFounds', context: context);

  @override
  int get activeFounds {
    _$activeFoundsAtom.reportRead();
    return super.activeFounds;
  }

  @override
  set activeFounds(int value) {
    _$activeFoundsAtom.reportWrite(value, super.activeFounds, () {
      super.activeFounds = value;
    });
  }

  late final _$inactiveFoundsAtom =
      Atom(name: 'ProductViewModelBase.inactiveFounds', context: context);

  @override
  int get inactiveFounds {
    _$inactiveFoundsAtom.reportRead();
    return super.inactiveFounds;
  }

  @override
  set inactiveFounds(int value) {
    _$inactiveFoundsAtom.reportWrite(value, super.inactiveFounds, () {
      super.inactiveFounds = value;
    });
  }

  late final _$listActiveAsyncAction =
      AsyncAction('ProductViewModelBase.listActive', context: context);

  @override
  Future<dynamic> listActive() {
    return _$listActiveAsyncAction.run(() => super.listActive());
  }

  late final _$listInactiveAsyncAction =
      AsyncAction('ProductViewModelBase.listInactive', context: context);

  @override
  Future<dynamic> listInactive() {
    return _$listInactiveAsyncAction.run(() => super.listInactive());
  }

  late final _$registerAsyncAction =
      AsyncAction('ProductViewModelBase.register', context: context);

  @override
  Future<dynamic> register(ProductRegisterDto product) {
    return _$registerAsyncAction.run(() => super.register(product));
  }

  late final _$updateAsyncAction =
      AsyncAction('ProductViewModelBase.update', context: context);

  @override
  Future<dynamic> update(String id, ProductUpdateDto product) {
    return _$updateAsyncAction.run(() => super.update(id, product));
  }

  late final _$ProductViewModelBaseActionController =
      ActionController(name: 'ProductViewModelBase', context: context);

  @override
  dynamic listFilterByName(String name) {
    final _$actionInfo = _$ProductViewModelBaseActionController.startAction(
        name: 'ProductViewModelBase.listFilterByName');
    try {
      return super.listFilterByName(name);
    } finally {
      _$ProductViewModelBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
productsListActive: ${productsListActive},
productsListInactive: ${productsListInactive},
productFilterListActive: ${productFilterListActive},
productFilterListInactive: ${productFilterListInactive},
productsByStore: ${productsByStore},
activeFounds: ${activeFounds},
inactiveFounds: ${inactiveFounds}
    ''';
  }
}
