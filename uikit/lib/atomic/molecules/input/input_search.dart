// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class InputSearch extends StatelessWidget {
  final void Function(String) onChanged;
  final String hintText;
  final String icon;
  const InputSearch({
    super.key,
    required this.onChanged,
    required this.hintText,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return InputDefault(
      hintText: hintText,
      icon: icon,
      onChanged: onChanged,
    );
  }
}
