// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:uikit/uikit.dart';

class CardDefault extends StatelessWidget {
  final void Function()? onTap;
  final Widget child;
  final double? borderRadius;
  final EdgeInsets? padding;
  const CardDefault({
    super.key,
    this.onTap,
    required this.child,
    this.borderRadius,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(Scale.sm),
      onTap: onTap,
      child: Container(
        padding: padding,
        decoration: BoxDecoration(
          border: Border.all(color: LightColors.tertiary, width: 1.5),
          borderRadius: BorderRadius.all(
            Radius.circular(borderRadius != null ? borderRadius! : Scale.md),
          ),
        ),
        child: child),
      
    );
  }
}
