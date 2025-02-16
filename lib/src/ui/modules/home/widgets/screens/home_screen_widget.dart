import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_fome/src/constants/icon_constant.dart';
import 'package:my_fome/src/constants/image_error_constant.dart';
import 'package:my_fome/src/constants/text_constant.dart';
import 'package:my_fome/src/ui/controllers/auth/auth_google_controller.dart';
import 'package:my_fome/src/ui/controllers/product/product_controller.dart';
import 'package:my_fome/src/ui/modules/home/widgets/screens/product_detail_screen_widget.dart';
import 'package:uikit/uikit.dart';

class HomeScreenWidget extends StatefulWidget {
  const HomeScreenWidget({super.key});

  @override
  State<HomeScreenWidget> createState() => _HomeScreenWidgetState();
}

class _HomeScreenWidgetState extends State<HomeScreenWidget> {
  final authController = Injector.get<AuthGoogleController>();

  final productController = Injector.get<ProductController>();

  @override
  void initState() {
    super.initState();
    productController.listProductsActive();
  }

  @override
  Widget build(BuildContext context) {
      return SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: SizeToken.md),
            Observer(builder: (_) {
              if (authController.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              return TextHeadlineH1(
                text: TextConstant.helloUser(authController.user?.name),
              );
            }),
            TextBodyB1SemiDark(text: TextConstant.welcome),
            const SizedBox(height: SizeToken.md),
            InputSearch(
              onChanged: productController.filterProducts,
              hintText: TextConstant.search,
              icon: IconConstant.search,
            ),
            const SizedBox(height: SizeToken.xxs),
            Observer(builder: (_) {
              return Container(
                padding: const EdgeInsets.only(right: SizeToken.xs),
                alignment: Alignment.centerRight,
                child: TextBodyB2SemiDark(
                  text: TextConstant.found(productController.activeFounds),
                ),
              );
            }),
            const SizedBox(height: SizeToken.md),
            Observer(builder: (_) {
              if (productController.isLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if (productController.productsActive == null ||
                  productController.productsActive!.isEmpty) {
                return BannerError(
                  image: ImageErrorConstant.empty,
                  text: TextConstant.productNotFound,
                );
              }
              return GridView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: MediaQuery.of(context).size.width < 375
                      ? double.infinity
                      : 175,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 15,
                  mainAxisExtent: 270,
                ),
                itemCount: productController.productsActive?.length ?? 0,
                itemBuilder: (context, index) {
                  final product = productController.productsActive?[index];
                  return ProductItem(
                    image: product!.image,
                    name: product.name,
                    quantity: TextConstant.quantityAvailable(product.amount),
                    price:
                        TextConstant.monetaryValue(double.parse(product.price)),
                    onTap: () => Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            ProductDetailScreenWidget(product: product),
                      ),
                    ),
                  );
                },
              );
            }),
          ],
        ),
      );
  }
}
