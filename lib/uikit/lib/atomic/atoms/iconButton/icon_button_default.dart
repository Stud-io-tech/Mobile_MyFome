// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import 'package:uikit/uikit.dart';

class IconButtonDefault extends StatelessWidget {
  final Icon icon;
  final String tooltipText;
  final void Function()? onPressed;
  const IconButtonDefault({
    super.key,
    required this.icon,
    required this.tooltipText,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: onPressed,
      icon: icon,
      tooltip: tooltipText,
      style: ButtonStyle(
        shape: WidgetStatePropertyAll(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(Scale.xs),
          ),
        ),
      ),
    );
  }
}
