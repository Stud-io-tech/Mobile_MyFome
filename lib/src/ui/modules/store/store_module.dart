import 'package:flutter/widgets.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:my_fome/src/ui/modules/home/controllers/products/product_controller.dart';
import 'package:my_fome/src/ui/modules/store/controllers/store/store_controller.dart';
import 'package:my_fome/src/ui/modules/store/controllers/uploads/upload_controller.dart';
import 'package:my_fome/src/ui/modules/store/pages/store_page.dart';
import 'package:my_fome/src/ui/modules/store/widgets/my_store_screen_widget.dart';
import 'package:my_fome/src/ui/modules/store/widgets/register_store.dart';

class StoreModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
/*        Bind.lazySingleton<StoreRepository>(
          (i) => StoreRepositoryImpl(
            clientService: i(),
          ),
        ),
        Bind.lazySingleton(
          (i) => StoreViewModel(
            storeRepository: i(),
            resultMessageService: i(),
          ),
        ), */
        Bind.lazySingleton(
          (i) => StoreController(
            storeViewModel: i(),
          ),
        ),
        Bind.lazySingleton(
          (i) => UploadController(),
        ),
        Bind.lazySingleton(
          (i) => ProductController(
            productViewModel: i(),
          ),
        ),
      ];

  @override
  String get moduleRouteName => '/store';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/': (context) => StorePage(),
        '/my': (context) => MyStoreScreen(),
        '/register': (context) => RegisterStore(),
      };
}
