// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class InputUploadImage extends StatelessWidget {
  final void Function() onTap;
  final String labelText;
  final String hintText;
  final String icon;
  const InputUploadImage({
    super.key,
    required this.onTap,
    required this.labelText,
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextLabelL1Dark(text: labelText),
        const SizedBox(
          height: SizeToken.xs,
        ),
        InkWell(
          onTap: onTap,
          child: DottedBorder(
            color: ColorToken.semiDark,
            strokeWidth: 1,
            dashPattern: const [6, 3],
            child: Container(
              height: 120,
              width: double.infinity,
              color: ColorToken.neutral,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  IconSemiLargeSemiDark(
                    icon: icon,
                    padding: SizeToken.xxs,
                  ),
                  TextLabelL3SemiDark(
                    text: hintText,
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
