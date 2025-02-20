import 'package:mobx/mobx.dart';
part 'order_controller.g.dart';

class OrderController = OrderControllerBase with _$OrderController;

abstract class OrderControllerBase with Store {
  @observable
  int value = 1;

  @observable
  double price = 0.0;

  @computed
  double get totalValue => value * price;

  @action
  void setPrice(double newPrice) {
    price = newPrice;
  }

  @action
  void increment(int amount) {
    if (value < amount) {
      value = value + 1;
    }
  }

  @action
  void decrement() {
    if (value > 1) {
      value = value - 1;
    }
  }
}
