// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:image_picker/image_picker.dart';
import 'package:mobx/mobx.dart';
import 'package:my_fome/src/domain/dtos/products/product_detail_dto.dart';
import 'package:my_fome/src/domain/dtos/products/product_register_dto.dart';
import 'package:my_fome/src/domain/dtos/products/product_update_dto.dart';

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
  int get foundsByStore => productViewModel.foundsByStore;

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

  register(ProductRegisterDto product, XFile image) async {
    await productViewModel.register(product, image);
  }

  update(String id, ProductUpdateDto product, {XFile? image}) async {
    await productViewModel.update(id, product, image: image);
  }
}
