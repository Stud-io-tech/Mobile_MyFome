// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:uikit/uikit.dart';

class SearchInput extends StatelessWidget {
  final void Function(String)? onChanged;
  final String text;
  const SearchInput({
    super.key,
    this.onChanged,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return InputDefault(
      hintText: text,
      icon: const Icon(
        Icons.search,
        size: Scale.md,
      ),
      onChanged: onChanged,
    );
  }
}
