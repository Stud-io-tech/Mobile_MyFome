// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class IconMediumDark extends StatelessWidget {
  final void Function()? onTap;
  final String icon;
  final bool? isBackgroundColor;

  const IconMediumDark({
    super.key,
    this.onTap,
    required this.icon,
    this.isBackgroundColor = false,
  });

  @override
  Widget build(BuildContext context) {
    return IconDefault(
      isBackgroundColor: isBackgroundColor,
      padding: SizeToken.sm,
      onTap: onTap,
      icon: icon,
      height: 13,
      colorIcon: ColorToken.dark,
    );
  }
}
