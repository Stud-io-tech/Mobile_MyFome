// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:my_fome/src/core/constants/text_constant.dart';
import 'package:my_fome/src/core/dtos/user/detail_user_dto.dart';
import 'package:my_fome/uikit/lib/uikit.dart';

class ItemUserHorizontal extends StatelessWidget {
  final DetailUserDto model;
  final void Function() onPressed;
  final Icon? icon;
  final String? tooltipText;
  const ItemUserHorizontal({
    super.key,
    required this.model,
    required this.onPressed,
    this.icon,
    this.tooltipText,
  });

  @override
  Widget build(BuildContext context) {
    return CardDefault(
      padding: EdgeInsets.zero,
      borderRadius: Scale.xxs,
      child: Container(
        padding: const EdgeInsets.all(Scale.sm),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ListTile(
              minVerticalPadding: 0,
              dense: true,
              contentPadding: EdgeInsets.zero,
              leading: model.photo != null
                  ? Container(
                      width: 40,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          image: NetworkImage(model.photo!),
                          fit: BoxFit.contain,
                        ),
                      ),
                    )
                  : IconButtonDefault(
                      icon: const Icon(Icons.person_pin_outlined),
                      tooltipText: TextConstant.myAccount,
                      onPressed: () {},
                    ),
              title: BodyText(text: model.name),
              subtitle: LabelText(text: model.email),
              trailing: icon != null
                  ? IconButtonDefault(
                      icon: icon!,
                      tooltipText: tooltipText ?? '',
                      onPressed: onPressed,
                    )
                  : null,
            ),
          ],
        ),
      ),
    );
  }
}
