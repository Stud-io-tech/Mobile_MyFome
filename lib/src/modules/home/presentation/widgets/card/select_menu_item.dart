// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:my_fome/uikit/lib/uikit.dart';
import 'package:flutter/material.dart';


class SelectMenuItem extends StatelessWidget {
  final IconData icon;
  final String text;
  final void Function() onTap;
  const SelectMenuItem({
    super.key,
    required this.icon,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      color: LightColors.tertiary,
      height: MediaQuery.of(context).size.height - 447,
      child: CardDefault(
        borderRadius: Scale.xs,
        onTap: onTap,
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(
            icon,
            size: Scale.lg,
          ),
          const SizedBox(
             height: Scale.xxs,
          ),
          LabelText(text: text)
        ],
      )),
    );
  }
}
