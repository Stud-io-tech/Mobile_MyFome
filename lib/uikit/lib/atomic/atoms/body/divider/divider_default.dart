import 'package:uikit/uikit.dart';
import 'package:flutter/material.dart';

class DividerDefault extends StatelessWidget {
  const DividerDefault({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.only(left: Scale.xs, right: Scale.xs),
      child: Divider(
        color: LightColors.tertiary,
      ),
    );
  }
}
