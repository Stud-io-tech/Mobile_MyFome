// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:uikit/uikit.dart';
class FormInput extends StatelessWidget {
  final TextEditingController controller;
  final int maxLines;
  final TextInputType? keyBoardType;
  final List<TextInputFormatter>? inputFormatters;
  final String? Function(String?)? validator;
  final String text;
  final Widget? prefix;
  final Widget? suffix;

  const FormInput({
    super.key,
    required this.controller,
    this.maxLines = 1,
    this.keyBoardType,
    this.inputFormatters,
    this.validator,
    required this.text,
    this.prefix,
    this.suffix,
  });

  @override
  Widget build(BuildContext context) {
    return InputDefault(
      keyBoardType: keyBoardType,
      maxLines: maxLines,
      controller: controller,
      inputFormatters: inputFormatters,
      validator: validator,
      hintText: text,
      prefix: prefix,
      suffix: suffix,
    );
  }
}
