// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class IconButtonSmallDark extends StatelessWidget {
  final void Function() onTap;
  final String icon;
  final bool isBackgroundColor;
  const IconButtonSmallDark({
    super.key,
    required this.onTap,
    required this.icon,
    this.isBackgroundColor = true,
  });

  @override
  Widget build(BuildContext context) {
    return IconDefault(
      padding: SizeToken.xxs,
      onTap: onTap,
      isBackgroundColor: isBackgroundColor,
      icon: icon,
      height: 11,
      colorIcon: ColorToken.dark,
    );
  }
}
