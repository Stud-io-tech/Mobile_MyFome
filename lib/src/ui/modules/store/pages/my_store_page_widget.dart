import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_fome/src/constants/icon_constant.dart';
import 'package:my_fome/src/constants/text_constant.dart';
import 'package:my_fome/src/ui/controllers/product/product_controller.dart';
import 'package:my_fome/src/ui/controllers/auth/auth_google_controller.dart';
import 'package:my_fome/src/ui/modules/product/widgets/screen/my_product_detail_screen.dart';
import 'package:uikit/uikit.dart';
import 'package:url_launcher/url_launcher_string.dart';

class MyStorePage extends StatelessWidget {
  MyStorePage({
    super.key,
  });

  final productController = Injector.get<ProductController>();
  final authController = Injector.get<AuthGoogleController>();

  @override
  Widget build(BuildContext context) {
    authController.load();
    final store = authController.store;
    productController.listProductsByStore(store!.id);
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ImageDetail(
              image: store.image,
              iconLeft: IconConstant.arrowLeft,
              onTapIconLeft: () =>
                  Navigator.of(context).pushReplacementNamed('/'),
              iconRigth: IconConstant.edit,
              onTapIconRight: () => Navigator.of(context)
                  .pushReplacementNamed('/store/update', arguments: store),
            ),
            const SizedBox(
              height: SizeToken.lg,
            ),
            ContentDefault(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextHeadlineH1(text: store.name),
                      ),
                      Padding(
                          padding: const EdgeInsets.only(left: SizeToken.sm),
                          child: IconButtonLargeDark(
                              onTap: () => launchUrlString(
                                  'https://wa.me/${store.whatsapp}?text=Olá, ${store.name}!%0A%0AEu gostaria de tirar algumas dúvidas. Você poderia me ajudar?'),
                              icon: IconConstant.whatsapp)),
                    ],
                  ),
                  const SizedBox(
                    height: SizeToken.md,
                  ),
                  TextBodyB1SemiDark(
                    text: store.description,
                  ),
                  const SizedBox(
                    height: SizeToken.md,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      TextHeadlineH2(text: TextConstant.storeProducts),
                      LinkSeeMore(
                        text: TextConstant.seeMore,
                        onTap: () => Navigator.of(context).pushReplacementNamed(
                            '/product/my',
                            arguments: store),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: SizeToken.sm,
                  ),
                  Observer(builder: (context) {
                    final products = productController.productsByStore;
                    if (productController.isLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (products == null) {
                      return TextLabelL2Dark(
                          text: TextConstant.productNotFound);
                    }
                    return SizedBox(
                      height: 270,
                      child: GridView.builder(
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 1,
                          mainAxisSpacing: 15,
                          crossAxisSpacing: 15,
                          mainAxisExtent: 175,
                        ),
                        itemCount: productController.productsByStore != null
                            ? (productController.productsByStore!.length > 5
                                ? 5
                                : productController.productsByStore!.length)
                            : 0,
                        itemBuilder: (context, index) {
                          final product =
                              productController.productsByStore?[index];
                          return ProductItem(
                            icon: IconConstant.remove,
                            onTapIcon: () {},
                            image: product!.image,
                            name: product.name,
                            quantity:
                                TextConstant.quantityAvailable(product.amount),
                            price: TextConstant.monetaryValue(
                                double.parse(product.price)),
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    MyProductDetailScreen(product: product),
                              ),
                            ),
                          );
                        },
                      ),
                    );
                  }),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
