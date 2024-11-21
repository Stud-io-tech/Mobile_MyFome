// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:my_fome/src/core/constants/text_constant.dart';
import 'package:my_fome/src/core/dtos/product/product_detail_dto.dart';
import 'package:my_fome/uikit/lib/uikit.dart';

class ItemProductHorizontal extends StatelessWidget {
  final ProductDetailDto model;
  final void Function()? onTap;
  const ItemProductHorizontal({
    super.key,
    required this.model,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return CardDefault(
      onTap: onTap,
      borderRadius: Scale.sm,
      child: Container(
        padding: const EdgeInsets.all(Scale.sm),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.network(
              model.image,
              fit: BoxFit.contain,
              width: 80,
            ),
            const SizedBox(
              width: Scale.xs,
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: Scale.xs),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BodyText(text: model.name),
                    const SizedBox(
                      height: Scale.xxs,
                    ),
                    LabelText(
                      text: model.description,
                      maxLines: 1,
                      overflow: true,
                    ),
                    const SizedBox(
                      height: Scale.xxs,
                    ),
                    FooterText(text: model.institute),
                    const SizedBox(
                      height: Scale.xxs,
                    ),
                    FooterText(
                      text: "${model.quantity} ${TextConstant.available}",
                      maxLines: 1,
                      overflow: true,
                    ),
                    const SizedBox(
                      height: Scale.xxs,
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: BodyText(
                        text:
                            "R\$ ${model.price.toStringAsFixed(2).replaceAll('.', ',')}",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
