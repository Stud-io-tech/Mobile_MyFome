// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_getit/flutter_getit.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:my_fome/src/core/dtos/product/product_detail_dto.dart';
import 'package:my_fome/src/core/widgets/item/product/item_product_vertical.dart';
import 'package:my_fome/src/modules/home/presentation/controllers/product/product_controller.dart';
import 'package:my_fome/uikit/lib/uikit.dart';

class ItemProduct extends StatefulWidget {
  final String id;
  const ItemProduct({
    super.key,
    required this.id,
  });

  @override
  State<ItemProduct> createState() => _ItemProductState();
}

class _ItemProductState extends State<ItemProduct> {
  final productController = Injector.get<ProductController>();
  @override
  void initState() {
    super.initState();
    productController.initProductByProductCategory(widget.id);
  }

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      final productPageDto = productController.productPageDto;

      if (productPageDto == null) {
        return const Center(child: CircularProgressIndicator());
      }

      return GridView.builder(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: Scale.xs,
          mainAxisSpacing: Scale.xs,
          mainAxisExtent: 153,
        ),
        itemCount: productPageDto.productDto.length > 4
            ? 4
            : productPageDto.productDto.length,
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final ProductDetailDto model = productPageDto.productDto[index];
          return ItemProductVertical(model: model);
        },
      );
    });
  }
}
