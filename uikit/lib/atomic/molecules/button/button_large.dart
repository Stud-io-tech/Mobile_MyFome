// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class ButtonLarge extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const ButtonLarge({
    super.key,
    required this.text,
    this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ButtonDefault(
        isBorderRadio: false,
        padding: const EdgeInsets.symmetric(vertical: SizeToken.lg),
        backgroundColor: ColorToken.danger,
        onPressed: onPressed,
        child: TextLabelL1Light(
          text: text,
        ),
      ),
    );
  }
}
