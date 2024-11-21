import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_fome/src/core/constants/text_constant.dart';
import 'package:my_fome/src/core/controllers/auth/auth_controller.dart';
import 'package:my_fome/src/core/controllers/route/route_controller.dart';
import 'package:my_fome/src/modules/home/presentation/controllers/product/product_controller.dart';
import 'package:my_fome/uikit/lib/uikit.dart';

class ProductDetail extends StatefulWidget {
  const ProductDetail({super.key});

  @override
  State<ProductDetail> createState() => _ProductDetailState();
}

class _ProductDetailState extends State<ProductDetail> {
  final authController = Injector.get<AuthController>();
  final routeController = Injector.get<RouteController>();
  final productController = Injector.get<ProductController>();

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    final arguments = ModalRoute.of(context)?.settings.arguments as Map?;
    if (arguments != null) {
      productController.detail(arguments['productId']);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        titleSpacing: 0,
        toolbarHeight: kToolbarHeight,
        title: Observer(
          builder: (context) {
            final model = productController.product;

            if (productController.isLoading) {
              return const CircularProgressIndicator();
            }

            return HeadlineText(text: model!.name);
          },
        ),
        leading: IconButtonDefault(
          icon: const Icon(Icons.arrow_back),
          tooltipText: TextConstant.back,
          onPressed: () async {
            await routeController.routeUpdate('/home');
            await routeController.routeGet();
            Navigator.of(context)
                .pushReplacementNamed(routeController.route.toString());
          },
        ),
      ),
      body: Observer(
        builder: (context) {
          final model = productController.product;

          if (productController.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          return SingleChildScrollView(
            child: BodyDefault(
              body: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.network(
                    model!.image,
                    fit: BoxFit.contain,
                    width: double.infinity,
                  ),
                  const SizedBox(
                    height: Scale.sm,
                  ),
                  LabelText(text: model.description),
                  const SizedBox(
                    height: Scale.xxs,
                  ),
                  LabelText(
                    text: model.category,
                  ),
                  const SizedBox(
                    height: Scale.xxs,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      LabelText(text: "${model.quantity} ${TextConstant.available}"),
                      LabelText(
                          text:
                              "R\$ ${model.price.toStringAsFixed(2).replaceAll('.', ',')}")
                    ],
                  ),
                  const SizedBox(
                    height: Scale.xxs,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
