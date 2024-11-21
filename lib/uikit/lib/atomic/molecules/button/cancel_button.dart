// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:uikit/uikit.dart';
import 'package:flutter/material.dart';

class CancelButton extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CancelButton({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ButtonDefault(
      backgroundColor: LightColors.tertiary,
      foregroundColor: LightColors.onPrimary,
      onPressed: onPressed,
      child: BodyText(text: text),
    );
  }
}
