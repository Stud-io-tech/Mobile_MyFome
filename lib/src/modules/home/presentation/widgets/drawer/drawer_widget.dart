import 'package:my_fome/src/core/constants/text_constant.dart';
import 'package:my_fome/uikit/lib/uikit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:my_fome/src/core/controllers/auth/auth_controller.dart';
import 'package:my_fome/src/core/controllers/route/route_controller.dart';

class DrawerWidget extends StatelessWidget {
  DrawerWidget({super.key});

  final authController = Injector.get<AuthController>();
  final routeController = Injector.get<RouteController>();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0,
      shape: const RoundedRectangleBorder(borderRadius: BorderRadius.zero),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(Scale.xxs),
            child: Row(
              children: [
                IconButtonDefault(
                  icon: const Icon(Icons.menu),
                  tooltipText: TextConstant.back,
                  onPressed: () => Navigator.of(context).pop(),
                ),
                Image.asset(
                  'assets/images/ENTREGAS-LOGO-HORIZONTAL.png',
                  fit: BoxFit.cover,
                  height: Scale.lg,
                ),
              ],
            ),
          ),
          const SizedBox(
             height: Scale.xxs,
          ),
          Expanded(
            child: ContentDefault(
              child: DrawerDefault(
                homeText: TextConstant.home,
                home: () async {
                  await routeController.routeUpdate('/home');
                  await routeController.routeGet();
                  Navigator.of(context)
                      .pushReplacementNamed(routeController.route.toString());
                },
                myLocationText: TextConstant.myLocations,
                myLocation: () async {
                  Navigator.of(context)
                      .pushReplacementNamed('/search/institute/by/user');
                },
                productText: TextConstant.products,
                product: () async {
                  Navigator.of(context)
                      .pushReplacementNamed('/search/product');
                },
                storeText: TextConstant.stores,
                store: () async {
                  await routeController.routeUpdate('/store');
                  await routeController.routeGet();
                  Navigator.of(context)
                      .pushReplacementNamed(routeController.route.toString());
                },
                myAccountText: TextConstant.myAccount,
                myAccount: () async {
                  await routeController.routeUpdate('/my-account');
                  await routeController.routeGet();
                  Navigator.of(context)
                      .pushReplacementNamed(routeController.route.toString());
                },
                logoutText: TextConstant.logout,
                logout: () async {
                  await authController.logout();
                  await routeController.routeClean();
                  Navigator.of(context).pushReplacementNamed('/login');
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
