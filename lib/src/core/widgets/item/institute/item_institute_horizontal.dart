// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:my_fome/src/core/dtos/institute/institute_detail_dto.dart';
import 'package:my_fome/uikit/lib/uikit.dart';

class ItemInstituteHorizontal extends StatelessWidget {
  final InstituteDetailDto model;
  final void Function() onTap;
  const ItemInstituteHorizontal({
    super.key,
    required this.model,
    required this.onTap,
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
                    FooterText(text: model.city),
                    const SizedBox(
                      height: Scale.xxs,
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
