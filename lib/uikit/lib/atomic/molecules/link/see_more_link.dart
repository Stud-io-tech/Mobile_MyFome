// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:uikit/uikit.dart';
import 'package:flutter/material.dart';

class SeeMoreLink extends StatelessWidget {
  final String text;
  final void Function() onTap;
  const SeeMoreLink({
    super.key,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FooterText(text: text,),
          const Icon(
            Icons.keyboard_arrow_right_rounded,
            size: Scale.sm,
          )
        ],
      ),
    );
  }
}
