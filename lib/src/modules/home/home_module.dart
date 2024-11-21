import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:my_fome/src/modules/home/home_route.dart';
import 'package:my_fome/src/modules/home/presentation/controllers/institute/institute_controller.dart';
import 'package:my_fome/src/modules/home/presentation/controllers/product/product_controller.dart';
import 'package:my_fome/src/modules/home/presentation/controllers/product_category/product_category_controller.dart';
import 'package:my_fome/src/modules/home/presentation/pages/product_detail.dart';
import 'package:my_fome/src/modules/home/repositories/institute/institute_repository.dart';
import 'package:my_fome/src/modules/home/repositories/institute/institute_repository_impl.dart';
import 'package:my_fome/src/modules/home/repositories/product/product_repository.dart';
import 'package:my_fome/src/modules/home/repositories/product/product_repository_impl.dart';
import 'package:my_fome/src/modules/home/repositories/productCategory/produc_category_repository.dart';
import 'package:my_fome/src/modules/home/repositories/productCategory/produc_category_repository_impl.dart';
import 'package:my_fome/src/modules/home/viewmodels/institute/institute_viewmodel.dart';
import 'package:my_fome/src/modules/home/viewmodels/product/product_viewmodel.dart';
import 'package:my_fome/src/modules/home/viewmodels/productCategory/product_category_viewmodel.dart';

class HomeModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<ProducCategoryRepository>(
          (i) => ProducCategoryRepositoryImpl(
            clientService: i(),
          ),
        ),
        Bind.lazySingleton(
          (i) => ProductCategoryViewmodel(
            repository: i(),
            messageService: i(),
          ),
        ),
        Bind.lazySingleton(
          (i) => ProductCategoryController(
            viewmodel: i(),
          ),
        ),
        Bind.lazySingleton<ProductRepository>(
          (i) => ProductRepositoryImpl(
            service: i(),
          ),
        ),
        Bind.lazySingleton(
            (i) => ProductViewmodel(repository: i(), messageService: i())),
        Bind.lazySingleton(
          (i) => ProductController(
            viewmodel: i(),
          ),
        ),
        Bind.lazySingleton<InstituteRepository>(
          (i) => InstituteRepositoryImpl(
            service: i(),
          ),
        ),
        Bind.lazySingleton(
          (i) => InstituteViewmodel(
            repository: i(),
            messageService: i(),
          ),
        ),
        Bind.lazySingleton(
          (i) => InstituteController(
            viewmodel: i(),
          ),
        )
      ];

  @override
  String get moduleRouteName => '/home';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/': (context) => const HomeRoute(),
        '/product/detail': (context) => const ProductDetail(),
      };
}
