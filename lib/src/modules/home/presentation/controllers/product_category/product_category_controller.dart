// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:mobx/mobx.dart';

import 'package:my_fome/src/core/dtos/productCategory/product_category_page_dto.dart';
import 'package:my_fome/src/modules/home/viewmodels/productCategory/product_category_viewmodel.dart';

part 'product_category_controller.g.dart';

class ProductCategoryController = ProductCategoryControllerBase
    with _$ProductCategoryController;

abstract class ProductCategoryControllerBase with Store {
  final ProductCategoryViewmodel viewmodel;
  ProductCategoryControllerBase({
    required this.viewmodel,
  });

  @computed
  ProductCategoryPageDto? get productListPage => viewmodel.productCategoryList;

  @action
  init() async {
    await viewmodel.listProductPage();
  }
}
