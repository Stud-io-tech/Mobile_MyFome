import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_fome/src/constants/icon_constant.dart';
import 'package:my_fome/src/constants/image_error_constant.dart';
import 'package:my_fome/src/constants/text_constant.dart';
import 'package:my_fome/src/ui/controllers/product/product_controller.dart';
import 'package:my_fome/src/ui/modules/product/widgets/screen/my_product_detail_screen.dart';
import 'package:uikit/uikit.dart';

class ProductInactiveScreenWidget extends StatelessWidget {
  ProductInactiveScreenWidget({super.key});

  final productController = Injector.get<ProductController>();

  @override
  Widget build(BuildContext context) {
    productController.listProductsInactive();
    return Observer(
      builder: (_) {
        if (productController.isLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (productController.productsInactive!.isEmpty) {
          return BannerError(
              image: ImageErrorConstant.empty,
              text: TextConstant.productNotFound);
        }
        return GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
            maxCrossAxisExtent:
                MediaQuery.of(context).size.width < 375 ? double.infinity : 175,
            mainAxisSpacing: 20,
            crossAxisSpacing: 15,
            mainAxisExtent: 270,
          ),
          itemCount: productController.productsInactive?.length ?? 0,
          itemBuilder: (context, index) {
            final product = productController.productsInactive?[index];
            return ProductItem(
              icon: IconConstant.restore,
              onTapIcon: () {},
              image: product!.image,
              name: product.name,
              quantity: TextConstant.quantityAvailable(product.amount),
              price: TextConstant.monetaryValue(double.parse(product.price)),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                    builder: (context) =>
                        MyProductDetailScreen(product: product)),
              ),
            );
          },
        );
      },
    );
  }
}
