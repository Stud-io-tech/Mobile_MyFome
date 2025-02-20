// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'order_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$OrderController on OrderControllerBase, Store {
  Computed<double>? _$totalValueComputed;

  @override
  double get totalValue =>
      (_$totalValueComputed ??= Computed<double>(() => super.totalValue,
              name: 'OrderControllerBase.totalValue'))
          .value;

  late final _$valueAtom =
      Atom(name: 'OrderControllerBase.value', context: context);

  @override
  int get value {
    _$valueAtom.reportRead();
    return super.value;
  }

  @override
  set value(int value) {
    _$valueAtom.reportWrite(value, super.value, () {
      super.value = value;
    });
  }

  late final _$priceAtom =
      Atom(name: 'OrderControllerBase.price', context: context);

  @override
  double get price {
    _$priceAtom.reportRead();
    return super.price;
  }

  @override
  set price(double value) {
    _$priceAtom.reportWrite(value, super.price, () {
      super.price = value;
    });
  }

  late final _$OrderControllerBaseActionController =
      ActionController(name: 'OrderControllerBase', context: context);

  @override
  void setPrice(double newPrice) {
    final _$actionInfo = _$OrderControllerBaseActionController.startAction(
        name: 'OrderControllerBase.setPrice');
    try {
      return super.setPrice(newPrice);
    } finally {
      _$OrderControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void increment(int amount) {
    final _$actionInfo = _$OrderControllerBaseActionController.startAction(
        name: 'OrderControllerBase.increment');
    try {
      return super.increment(amount);
    } finally {
      _$OrderControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void decrement() {
    final _$actionInfo = _$OrderControllerBaseActionController.startAction(
        name: 'OrderControllerBase.decrement');
    try {
      return super.decrement();
    } finally {
      _$OrderControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
value: ${value},
price: ${price},
totalValue: ${totalValue}
    ''';
  }
}
