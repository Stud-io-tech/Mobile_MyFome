// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class MenuItem extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Icon icon;
  const MenuItem({
    super.key,
    required this.text,
    this.onPressed,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        bottom: Scale.xs,
        top: Scale.xs,
      ),
      child: InkWell(
        onTap: onPressed,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            icon,
            const SizedBox(
              width: Scale.md,
            ),
            Column(
              children: [
                const SizedBox(height: Scale.xs),
                HeadlineText(text: text),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
