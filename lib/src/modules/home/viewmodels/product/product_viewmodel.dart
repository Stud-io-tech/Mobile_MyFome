// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter_getit/flutter_getit.dart';
import 'package:mobx/mobx.dart';
import 'package:my_fome/src/core/controllers/auth/auth_controller.dart';
import 'package:my_fome/src/core/controllers/route/route_controller.dart';
import 'package:my_fome/src/core/dtos/product/product_detail_dto.dart';
import 'package:my_fome/src/core/dtos/product/product_page_dto.dart';
import 'package:my_fome/src/core/exceptions/rest_exception.dart';
import 'package:my_fome/src/core/services/messages/message_service.dart';
import 'package:my_fome/src/modules/home/repositories/product/product_repository.dart';

part 'product_viewmodel.g.dart';

class ProductViewmodel = ProductViewmodelBase with _$ProductViewmodel;

abstract class ProductViewmodelBase with Store {
  final ProductRepository repository;
  final MessageService messageService;

  ProductViewmodelBase({
    required this.repository,
    required this.messageService,
  });

  final authController = Injector.get<AuthController>();
  final routeController = Injector.get<RouteController>();

  @observable
  bool isLoading = false;

  @observable
  ProductPageDto? productList;

  @observable
  ProductDetailDto? product;

  @action
  Future<void> listProductByProdcutCategory(String productCategoryId) async {
    try {
      isLoading = true;
      productList =
          await repository.findAllPageByProductCategory(productCategoryId);
    } on RestException catch (e) {
      await authController.logout();
      await routeController.routeClean();
      await authController.accessTokenLoad();
      messageService.showMessageError(e.message);
    } finally {
      isLoading = false;
    }
  }

  @action
  Future<void> detail(String id) async {
    try {
      isLoading = true;
      product = await repository.detail(id);
    } on RestException catch (e) {
      messageService.showMessageError(e.message);
    } finally {
      isLoading = false;
    }
  }
}
