// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';
import 'package:my_fome/src/domain/dtos/products/product_detail_dto.dart';

import 'package:my_fome/src/ui/viewmodels/products/product_view_model.dart';

part 'product_controller.g.dart';

class ProductController = ProductControllerBase with _$ProductController;

abstract class ProductControllerBase with Store {
  final ProductViewModel productViewModel;
  ProductControllerBase({
    required this.productViewModel,
  });

  @computed
  int get activeFounds => productViewModel.activeFounds;

  @computed
  int get inactiveFounds => productViewModel.inactiveFounds;

  @computed
  bool get isLoading => productViewModel.isLoading;

  @computed
  List<ProductDetailDto>? get productsActive =>
      productViewModel.productFilterListActive;

  @computed
  List<ProductDetailDto>? get productsInactive =>
      productViewModel.productFilterListInactive;

  @computed
  List<ProductDetailDto>? get productsByStore =>
      productViewModel.productsByStore;

  listProductsActive() async {
    await productViewModel.listActive();
  }

  listProductsInactive() async {
    await productViewModel.listInactive();
  }

  filterProducts(String name) {
    productViewModel.listFilterByName(name);
  }

  listProductsByStore(String id) async {
    await productViewModel.listByStore(id);
  }
}
