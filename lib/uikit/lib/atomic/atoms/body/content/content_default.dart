// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:uikit/uikit.dart';
import 'package:flutter/material.dart';

class ContentDefault extends StatelessWidget {
  final Widget child;
  const ContentDefault({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: Scale.md,
        right: Scale.md,
      ),
      child: child,
    );
  }
}
