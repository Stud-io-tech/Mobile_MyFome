// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_fome/src/constants/icon_constant.dart';
import 'package:my_fome/src/constants/image_error_constant.dart';
import 'package:my_fome/src/constants/text_constant.dart';
import 'package:my_fome/src/domain/dtos/stores/store_detail_dto.dart';

import 'package:my_fome/src/ui/controllers/product/product_controller.dart';
import 'package:my_fome/src/ui/modules/home/widgets/screens/product_detail_screen_widget.dart';
import 'package:uikit/uikit.dart';

class ProductByStorePage extends StatefulWidget {
  final StoreDetailDto store;
  const ProductByStorePage({
    super.key,
    required this.store,
  });

  @override
  State<ProductByStorePage> createState() => _ProductByStorePageState();
}

class _ProductByStorePageState extends State<ProductByStorePage> {
  final productController = Injector.get<ProductController>();

@override
  void initState() {
    super.initState();
    productController.listProductsActiveByStore(widget.store.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentDefault(
        child: Column(
          children: [
            const SizedBox(
              height: SizeToken.xl3,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                IconButtonLargeDark(
                    onTap: () =>
                        Navigator.of(context).pushReplacementNamed('/'),
                    icon: IconConstant.arrowLeft),
                const SizedBox(
                  width: SizeToken.sm,
                ),
                TextHeadlineH2(text: widget.store.name)
              ],
            ),
            SingleChildScrollView(
              child: Column(
                children: [
                  const SizedBox(
                    height: SizeToken.lg,
                  ),
                  InputSearch(
                      onChanged: productController.filterProducts,
                      hintText: TextConstant.search,
                      icon: IconConstant.search),
                  const SizedBox(
                    height: SizeToken.xxs,
                  ),
                  Observer(builder: (_) {
                    return Container(
                      padding: const EdgeInsets.only(right: SizeToken.xs),
                      alignment: Alignment.centerRight,
                      child: TextBodyB2SemiDark(
                        text:
                            TextConstant.found(productController.activeFoundsByStore),
                      ),
                    );
                  }),
                  const SizedBox(
                    height: SizeToken.md,
                  ),
                  Observer(
                    builder: (_) {
                      if (productController.isLoading) {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      if (productController.productFilterListActiveByStore!.isEmpty) {
                        return BannerError(
                            image: ImageErrorConstant.empty,
                            text: TextConstant.productNotFound);
                      }
                      return GridView.builder(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent:
                              MediaQuery.of(context).size.width < 375
                                  ? double.infinity
                                  : 175,
                          mainAxisSpacing: 20,
                          crossAxisSpacing: 15,
                          mainAxisExtent: 270,
                        ),
                        itemCount:
                            productController.productFilterListActiveByStore?.length ?? 0,
                        itemBuilder: (context, index) {
                          final product =
                              productController.productFilterListActiveByStore?[index];
                          return ProductItem(
                            image: product!.image,
                            name: product.name,
                            quantity:
                                TextConstant.quantityAvailable(product.amount),
                            price: TextConstant.monetaryValue(
                                double.parse(product.price)),
                            onTap: () => Navigator.of(context).push(
                              MaterialPageRoute(
                                  builder: (context) =>
                                      ProductDetailScreenWidget(
                                          product: product)),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
