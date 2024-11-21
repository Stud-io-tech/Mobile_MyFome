// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:uikit/uikit.dart';
import 'package:flutter/material.dart';

class ProgressButton extends StatelessWidget {
  final String? text;
  final Widget? child;
  final void Function()? onPressed;
  const ProgressButton({
    super.key,
    this.text,
    this.child,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonDefault(
  
      backgroundColor: LightColors.secondary,
      foregroundColor: LightColors.onSecondary,
      onPressed: onPressed,
      child: child ?? BodyText(text: text!),
    );
  }
}
