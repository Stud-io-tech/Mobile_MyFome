import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_fome/src/constants/icon_constant.dart';
import 'package:my_fome/src/constants/logo_constant.dart';
import 'package:my_fome/src/constants/text_constant.dart';
import 'package:my_fome/src/ui/controllers/auth/auth_google_controller.dart';
import 'package:my_fome/src/ui/modules/home/controllers/button_navigator/button_navigator_menu_controller.dart';
import 'package:my_fome/src/ui/modules/home/widgets/screens/home_screen_widget.dart';
import 'package:my_fome/src/ui/modules/home/widgets/screens/product_screen.dart';
import 'package:my_fome/src/ui/modules/home/widgets/screens/store_screen.dart';
import 'package:uikit/uikit.dart';
// ignore: depend_on_referenced_packages
import 'package:flutter_svg/flutter_svg.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = ButtonNavigatorMenuController();

  final authController = Injector.get<AuthGoogleController>();

  final GlobalKey<ScaffoldState> drawerKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    authController.load();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: drawerKey,
      appBar: PreferredSize(
          preferredSize: const Size.fromHeight(80),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(
                SizeToken.md - 3.5, SizeToken.sm, SizeToken.md, 0),
            child: AppBar(
              title: SvgPicture.asset(LogoConstant.horizontal,
                  height: SizeToken.xxl),
              leading: Padding(
                padding: const EdgeInsets.all(3.5),
                child: IconButtonLargeDark(
                    key: const Key('drawerButton'),
                    icon: IconConstant.menu,
                    onTap: () => drawerKey.currentState?.openDrawer()),
              ),
              centerTitle: true,
              actions: [
                Padding(
                  padding: const EdgeInsets.all(3.5),
                  child: Observer(builder: (_) {
                    if (authController.user?.image != null) {
                      if (authController.isLoading) {
                        return const CircularProgressIndicator();
                      }
                      return ClipRRect(
                          borderRadius: BorderRadius.circular(SizeToken.lg),
                          child: Image.network(authController.user!.image!));
                    }
                    return IconButtonLargeDark(
                      key: const Key('loginButton'),
                      icon: IconConstant.user,
                      onTap: () => authController.login(),
                    );
                  }),
                ),
              ],
            ),
          )),
      drawer: DrawerMenu(
        firstOnPressed: () => Navigator.of(context).pushReplacementNamed('/'),
        secoundOnPressed: () =>
            Navigator.of(context).pushReplacementNamed('/product'),
        thirdOnPressed: () =>
            Navigator.of(context).pushReplacementNamed('/store'),
        fourthOnPressed: () {
          if (authController.user == null) {
            Navigator.of(context).pushReplacementNamed('/login');
            return;
          }
          if (authController.store != null) {
            Navigator.of(context).pushReplacementNamed('/store/my');
          } else {
            Navigator.of(context).pushReplacementNamed('/store/register');
          }
        },
        logoutOnPressed: () {
          if (authController.user?.email != null) {
            showCustomModalBottomSheet(
              context: context,
              builder: (context) => ModalSheet(
                iconBack: IconConstant.arrowLeft,
                title: TextConstant.logoutAccountTitle,
                description: TextConstant.logoutAccountMessage(
                    authController.user!.email),
                cancelText: TextConstant.no,
                continueText: TextConstant.yes,
                continueOnTap: () {
                  authController.logout();
                  Navigator.of(context).pop();
                  Navigator.of(context).pop();
                },
              ),
            );
          }
        },
        firstText: TextConstant.home,
        secoundText: TextConstant.products,
        thirdText: TextConstant.stores,
        fourthText: TextConstant.myStore,
        logoutText: TextConstant.logout,
        firstIcon: IconConstant.home,
        secoundIcon: IconConstant.search,
        thirdIcon: IconConstant.store,
        fourthIcon: IconConstant.storeAdd,
        logoutIcon: IconConstant.logout,
        menuIcon: IconConstant.menu,
        logo: LogoConstant.horizontal,
      ),
      body: ContentDefault(
        child: Observer(builder: (_) {
          return IndexedStack(
            index: controller.currentIndex,
            children: const [
              HomeScreenWidget(),
              ProductScreen(),
              StoreScreen(),
            ],
          );
        }),
      ),
      bottomNavigationBar: Observer(builder: (_) {
        return ButtonNavigatorMenu(
            currentIndex: controller.currentIndex,
            onTap: controller.onItemTapped,
            firstLabel: TextConstant.home,
            secoundLabel: TextConstant.products,
            thirdLabel: TextConstant.stores,
            firstIcon: IconConstant.home,
            secoundIcon: IconConstant.search,
            thirdIcon: IconConstant.store);
      }),
    );
  }
}
