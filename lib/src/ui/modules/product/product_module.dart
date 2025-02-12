import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:my_fome/src/ui/modules/product/pages/product_page.dart';

class ProductModule extends FlutterGetItModule {
  @override
  String get moduleRouteName => '/product';

  @override
  Map<String, WidgetBuilder> get pages => {
    '/': (context) => ProductPage(),
  };
}
