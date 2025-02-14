import 'package:flutter/widgets.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:my_fome/src/ui/modules/store/pages/store_page.dart';
import 'package:my_fome/src/ui/modules/store/pages/my_store_page_widget.dart';
import 'package:my_fome/src/ui/modules/store/widgets/register_store.dart';
import 'package:my_fome/src/ui/modules/store/widgets/update_store.dart';

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
        /* Bind.lazySingleton(
          (i) => StoreViewModel(
            resultMessageService: i(),
            storeRepository: i(),
          ),
        ),
        Bind.lazySingleton(
          (i) => StoreController(
            storeViewModel: i(),
          ),
        ),
        Bind.lazySingleton(
          (i) => UploadController(),
        ), */
      ];

  @override
  String get moduleRouteName => '/store';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/': (context) => StorePage(),
        '/my': (context) => const MyStorePage(),
        '/register': (context) => const RegisterStore(),
        '/update': (context) => const UpdateStore(),
      };
}
