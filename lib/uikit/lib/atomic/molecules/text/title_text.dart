// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class TitleText extends StatelessWidget {
  final int? maxLines;
  final String text;
  final bool overflow;
  final Color? color;
  const TitleText({
    super.key,
    this.maxLines,
    required this.text,
    this.overflow = false,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return TextDefault(
      text: text,
      textStyle: Style.title(color: color),
      overflow: overflow,
      maxLines: maxLines,
    );
  }
}