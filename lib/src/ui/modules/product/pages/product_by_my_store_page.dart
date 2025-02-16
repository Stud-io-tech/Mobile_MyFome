// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_fome/src/constants/icon_constant.dart';
import 'package:my_fome/src/constants/text_constant.dart';
import 'package:my_fome/src/domain/dtos/stores/store_detail_dto.dart';
import 'package:my_fome/src/ui/controllers/product/product_controller.dart';
import 'package:my_fome/src/ui/modules/product/controller/button_navigator/button_navigator_menu_controller.dart';
import 'package:my_fome/src/ui/modules/product/widgets/screen/product_active_screen_widget.dart';
import 'package:my_fome/src/ui/modules/product/widgets/screen/product_inactive_screen_widget.dart';
import 'package:uikit/uikit.dart';

class ProductByMyStorePage extends StatefulWidget {
  const ProductByMyStorePage({
    super.key,
  });

  @override
  State<ProductByMyStorePage> createState() => _ProductByMyStorePageState();
}

class _ProductByMyStorePageState extends State<ProductByMyStorePage> {
  final productController = Injector.get<ProductController>();

  final controller = ButtonNavigatorMenuController();

  late StoreDetailDto store;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    store = ModalRoute.of(context)!.settings.arguments as StoreDetailDto;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ContentDefault(
        child: Observer(builder: (_) {
          return SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: SizeToken.xl3,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        IconButtonLargeDark(
                            onTap: () => Navigator.of(context)
                                .pushReplacementNamed('/store/my'),
                            icon: IconConstant.arrowLeft),
                        const SizedBox(
                          width: SizeToken.sm,
                        ),
                        TextHeadlineH2(text: store.name)
                      ],
                    ),
                    IconButtonLargeDark(
                      isBackgroundColor: false,
                      onTap: () => Navigator.of(context).pushReplacementNamed(
                          '/product/register',
                          arguments: store),
                      icon: IconConstant.add,
                    )
                  ],
                ),
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
                      text: controller.currentIndex == 0
                          ? TextConstant.found(productController.activeFounds)
                          : TextConstant.found(
                              productController.inactiveFounds),
                    ),
                  );
                }),
                const SizedBox(
                  height: SizeToken.md,
                ),
                Observer(builder: (context) {
                  if (controller.currentIndex == 0) {
                    return Row(
                      children: [
                        Expanded(
                          child: ButtonSmallDark(
                            text: TextConstant.actives,
                            onPressed: () => controller.onItemTapped(0),
                          ),
                        ),
                        const SizedBox(
                          width: SizeToken.sm,
                        ),
                        Expanded(
                          child: ButtonSmallLight(
                            text: TextConstant.suspended,
                            onPressed: () => controller.onItemTapped(1),
                          ),
                        )
                      ],
                    );
                  }
                  return Row(
                    children: [
                      Expanded(
                        child: ButtonSmallLight(
                          text: TextConstant.actives,
                          onPressed: () => controller.onItemTapped(0),
                        ),
                      ),
                      const SizedBox(
                        width: SizeToken.sm,
                      ),
                      Expanded(
                        child: ButtonSmallDark(
                          text: TextConstant.suspended,
                          onPressed: () => controller.onItemTapped(1),
                        ),
                      )
                    ],
                  );
                }),
                const SizedBox(
                  height: SizeToken.md,
                ),
                IndexedStack(
                  index: controller.currentIndex,
                  children: const [
                    ProductActiveScreenWidget(),
                    ProductInactiveScreenWidget(),
                  ],
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
