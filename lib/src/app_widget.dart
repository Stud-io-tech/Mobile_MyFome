import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:my_fome/src/modules/home/home_module.dart';
import 'package:uikit/uikit.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
    return FlutterGetIt(
      bindingsBuilder: () {
        return [];
      },
      modules: [
        HomeModule(),
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
