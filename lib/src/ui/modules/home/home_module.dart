import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:my_fome/src/data/repositories/products/produtc_repository_impl.dart';
import 'package:my_fome/src/data/repositories/stores/store_repository_impl.dart';
import 'package:my_fome/src/domain/repositories/products/produtc_repository.dart';
import 'package:my_fome/src/domain/repositories/stores/store_repository.dart';
import 'package:my_fome/src/ui/modules/home/controllers/products/product_controller.dart';
import 'package:my_fome/src/ui/modules/home/controllers/store/store_controller.dart';
import 'package:my_fome/src/ui/modules/home/pages/home_page.dart';
import 'package:my_fome/src/ui/viewmodels/products/product_view_model.dart';
import 'package:my_fome/src/ui/viewmodels/stores/store_view_model.dart';

class HomeModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
        Bind.lazySingleton<ProdutcRepository>(
          (i) => ProdutcRepositoryImpl(
            clientService: i(),
          ),
        ),
        Bind.lazySingleton(
          (i) => ProductViewModel(
            productRepository: i(),
            resultMessageService: i(),
          ),
        ),
        Bind.lazySingleton(
          (i) => ProductController(
            productViewModel: i(),
          ),
        ),

        Bind.lazySingleton<StoreRepository>(
          (i) => StoreRepositoryImpl(
            clientService: i(),
          ),
        ),
        Bind.lazySingleton(
          (i) => StoreViewModel(
            storeRepository: i(),
            resultMessageService: i(),
          ),
        ),
        Bind.lazySingleton(
          (i) => StoreController(
            storeViewModel: i(),
          ),
        ),
      ];

  @override
  String get moduleRouteName => '/';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/': (context) => HomePage(),
      };
}
