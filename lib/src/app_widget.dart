import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:my_fome/src/data/repositories/products/produtc_repository_impl.dart';
import 'package:my_fome/src/data/repositories/stores/store_repository_impl.dart';
import 'package:my_fome/src/data/repositories/users/user_repository_impl.dart';
import 'package:my_fome/src/data/services/auth/auth_google_service.dart';
import 'package:my_fome/src/data/services/auth/auth_google_service_impl.dart';
import 'package:my_fome/src/data/services/client/client_service.dart';
import 'package:my_fome/src/data/services/client/client_service_impl.dart';
import 'package:my_fome/src/data/services/local/local_storage_service.dart';
import 'package:my_fome/src/data/services/local/local_storage_service_impl.dart';
import 'package:my_fome/src/data/services/messages/result_message_service.dart';
import 'package:my_fome/src/data/services/messages/result_message_service_impl.dart';
import 'package:my_fome/src/domain/repositories/products/produtc_repository.dart';
import 'package:my_fome/src/domain/repositories/stores/store_repository.dart';
import 'package:my_fome/src/domain/repositories/users/user_repository.dart';
import 'package:my_fome/src/ui/controllers/product/product_controller.dart';
import 'package:my_fome/src/ui/controllers/auth/auth_google_controller.dart';
import 'package:my_fome/src/ui/controllers/store/store_controller.dart';
import 'package:my_fome/src/ui/modules/home/home_module.dart';
import 'package:my_fome/src/ui/controllers/uploads/upload_controller.dart';
import 'package:my_fome/src/ui/modules/product/product_module.dart';
import 'package:my_fome/src/ui/modules/store/store_module.dart';
import 'package:my_fome/src/ui/viewmodels/products/product_view_model.dart';
import 'package:my_fome/src/ui/viewmodels/stores/store_view_model.dart';
import 'package:my_fome/src/ui/viewmodels/users/auth_view_model.dart';
import 'package:uikit/uikit.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    return FlutterGetIt(
      bindingsBuilder: () {
        return [
          Bind.singleton<LocalStorageService>((i) => LocalStorageServiceImpl()),
          Bind.singleton<ResultMessageService>(
              (i) => ResultMessageServiceImpl(navigatorKey: navigatorKey)),
          Bind.singleton<ClientService>((i) => ClientServiceImpl(i())),
          Bind.singleton<AuthGoogleService>((i) => AuthGoogleServiceImpl()),
          Bind.singleton<UserRepository>(
              (i) => UserRepositoryImpl(clientService: i())),
          Bind.singleton((i) => AuthViewModel(
              userRepository: i(),
              authGoogleService: i(),
              localStorageService: i(),
              resultMessageService: i())),
          Bind.singleton((i) => AuthGoogleController(authViewModel: i())),
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
          Bind.lazySingleton(
            (i) => UploadController(),
          ),
        ];
      },
      modules: [
        HomeModule(),
        StoreModule(),
        ProductModule(),
      ],
      builder: (context, routes, flutterGetItNavObserver) {
        return MaterialApp(
          title: 'My Fome',
          debugShowCheckedModeBanner: false,
          theme: theme,
          navigatorKey: navigatorKey,
          navigatorObservers: [flutterGetItNavObserver],
          routes: routes,
        );
      },
    );
  }
}
