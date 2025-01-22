import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_fome/src/constants/icon_constant.dart';
import 'package:my_fome/src/constants/logo_constant.dart';
import 'package:my_fome/src/constants/text_constant.dart';
import 'package:my_fome/src/data/services/auth/auth_google_service_impl.dart';
import 'package:my_fome/src/ui/modules/home/controllers/auth/auth_google_controller.dart';
import 'package:my_fome/src/ui/modules/home/controllers/button_navigator/button_navigator_menu_controller.dart';
import 'package:uikit/uikit.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = ButtonNavigatorMenuController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /* appBar: AppBar(
        title: const Text('Home Page'),
      ), */
      drawer: DrawerMenu(
        firstOnPressed: () {},
        secoundOnPressed: () {},
        thirdOnPressed: () {},
        fourthOnPressed: () {},
        logoutOnPressed: () {},
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
      body: Observer(builder: (_) {
        return IndexedStack(
          index: controller.currentIndex,
          children: [
            HomeScreen(),
            ProductScreen(),
            const StoreScreen(),
          ],
        );
      }),
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

class HomeScreen extends StatelessWidget {
  HomeScreen({super.key});
  final authController =
      AuthGoogleController(authGoogleService: AuthGoogleServiceImpl());
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonLarge(
          text: "Clique aqui",
          onPressed: () => showCustomModalBottomSheet(
            context: context,
            builder: (context) => ModelSheet(
              iconBack: IconConstant.arrowLeft,
              title: "title",
              description: "description",
              cancelText: "Não",
              continueText: "Sim",
              continueOnTap: () {
                authController.logout();
                debugPrint("Apertou!");
              },
            ),
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        Row(
          children: [
            ButtonSmallDark(
              text: "Tudo",
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBarListview(
                    title: "title",
                    subtitle: "subtitle",
                    iconLeading: IconConstant.success,
                    iconTrailing: IconConstant.close,
                    context: context,
                  ),
                );
              },
            ),
            const SizedBox(
              width: 10,
            ),
            ButtonSmallLight(
              text: "Originais",
              onPressed: () {
                authController.login();
              },
            ),
          ],
        ),
        const SizedBox(
          height: SizeToken.lg,
        ),
        Observer(builder: (_) {
          return Column(
            children: [
              Text("Nome: ${authController.googleCredentials?.displayName}"),
              Text("E-mail: ${authController.googleCredentials?.email}"),
              Text("Foto: ${authController.googleCredentials?.photoUrl}"),
            ],
          );
        }),
      ],
    );
  }
}

class ProductScreen extends StatelessWidget {
  ProductScreen({super.key});
  final nameEC = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ImageDetail(
            image:
                "https://images.unsplash.com/photo-1516802273409-68526ee1bdd6",
            iconLeft: IconConstant.arrowLeft,
            onTapIconLeft: () {},
            iconRigth: IconConstant.edit,
            onTapIconRight: () {},
          ),
          const SizedBox(
            height: SizeToken.sm,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InputSearch(
              onChanged: (String s) {},
              hintText: TextConstant.search,
              icon: IconConstant.search,
            ),
          ),
          const SizedBox(
            height: SizeToken.sm,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InputForm(
                hintText: "Nome",
                controller: nameEC,
                textInputAction: TextInputAction.done,
                labelText: "Nome"),
          ),
          const SizedBox(
            height: SizeToken.sm,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: InputUploadImage(
              onTap: () {},
              labelText: "Imagem",
              hintText: "Upload da Imagem",
              icon: IconConstant.upload,
            ),
          ),
          const SizedBox(
            height: SizeToken.sm,
          ),
          ProductItem(
            image:
                "https://images.unsplash.com/photo-1516802273409-68526ee1bdd6",
            name: "Fatia de Pizza Pepperoni 200g",
            quantity: TextConstant.quantityAvailable(15),
            price: TextConstant.monetaryValue(23.5),
            onTap: () {},
            icon: IconConstant.remove,
            onTapIcon: () {},
          ),
        ],
      ),
    );
  }
}

class StoreScreen extends StatelessWidget {
  const StoreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: StoreItem(
          name: "Urban Hot Dogs",
          description:
              "The Nike Throwback Pullover Hoodie The Nike Throwback Pullover Hoodie",
          image: "https://images.unsplash.com/photo-1516802273409-68526ee1bdd6",
          icon: IconConstant.chevronRigth,
          onTap: () {}),
    );
  }
}
