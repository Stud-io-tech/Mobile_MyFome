import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:my_fome/src/ui/modules/home/pages/home_page.dart';
import 'package:my_fome/src/ui/modules/home/pages/user_not_found_page.dart';

class HomeModule extends FlutterGetItModule {
  @override
  List<Bind<Object>> get bindings => [
        
      ];

  @override
  String get moduleRouteName => '/';

  @override
  Map<String, WidgetBuilder> get pages => {
        '/': (context) => HomePage(),
        '/login': (context) => UserNotFoundPage(),
      };
}
